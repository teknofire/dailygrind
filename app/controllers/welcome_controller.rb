class WelcomeController < ApplicationController
  def index
    @transaction = CoffeeCharge.new
    @start_date = Time.zone.now.beginning_of_week
    @end_date = Time.zone.now
    
    @drank_this_week = current_user.coffee_charges.where('created_at >= ?', Time.zone.now.beginning_of_week)
  end
end
