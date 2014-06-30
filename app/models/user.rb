class User < ActiveRecord::Base
  has_many :authorizations
  
  has_many :transactions
  has_many :coffee_charges
  
  attr_accessible :name, :email
  
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.create_from_hash!(hash)
    create(:name => hash['info']['name'], :email => hash['info']['email'])
  end
  
  def self.create_or_find_from_hash!(hash)
    user = where(email: hash['info']['email'].downcase).first
    user = create!(:name => hash['info']['name'], :email => hash['info']['email'].downcase) if user.nil?
    
    user
  end
  
  
  def balance
    transactions.sum(:amount)
  end
  
  def cups
    (self.balance / 0.55).to_i
  end
end
