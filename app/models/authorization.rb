class Authorization < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :provider, :uid, :user_id, :user, :host
  
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => [:host, :provider]
  
  def self.find_from_hash(hash, host)
    where(provider: hash['provider'], uid: hash['uid'], host: host).first
  end

  def self.create_from_hash(hash, user = nil, host='')
    user ||= User.create_or_find_from_hash!(hash)
    create(:user => user, :uid => hash['uid'], :provider => hash['provider'], host: host)
  end
end
