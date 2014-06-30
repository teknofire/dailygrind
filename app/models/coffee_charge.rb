class CoffeeCharge < Transaction
  def name
    'Coffee'
  end
  
  def self.default_price
    0.55
  end
  
  def default_price
    CoffeeCharge.default_price
  end
end
