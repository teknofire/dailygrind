class User < ActiveRecord::Base
  has_many :authorizations
  
  has_many :charges
  
  attr_accessible :name, :email
  
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.create_from_hash!(hash)
    create(:name => hash['info']['name'], :email => hash['info']['email'])
  end
  
  def balance
    charges.sum(:amount)
  end
  
  def cups
    self.balance / 0.5
  end
end
