class ChargesController < ApplicationController
  def new
    @charge = Charge.new
  end
  
  def create
    @charge = Charge.new(params[:charge])
    @charge.user = current_user
    
    if @charge.save
      respond_to do |format|
        format.html {
          flash[:success] = "Added $#{@charge.amount}"
          redirect_to root_url
        }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new' }
      end
    end
  end
end
