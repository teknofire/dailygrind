class Transaction < ActiveRecord::Base
  attr_accessible :amount, :name, :user_id
  
  belongs_to :user
  
  #validate :funds_must_be_positive
  
  def funds_must_be_positive
    if self.amount < 0
      if self.user.balance + self.amount < 0
        errors[:base] << 'You do not have enough funds to do this'
      end
    end
  end
end
