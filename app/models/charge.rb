class Charge < ActiveRecord::Base
  attr_accessible :amount, :name, :user_id
  
  belongs_to :user
end
