class WelcomeController < ApplicationController
  def index
    unless current_user.nil?
      @transaction = CoffeeCharge.new
      @start_date = Time.zone.now.beginning_of_week
      @end_date = Time.zone.now.end_of_week
    
      @drank_this_week = current_user.coffee_charges.where('created_at >= ?', Time.zone.now.beginning_of_week)
    end
  end
end
