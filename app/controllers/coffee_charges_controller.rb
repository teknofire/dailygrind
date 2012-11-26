class CoffeeChargesController < TransactionsController
  def create
    @transaction = current_user.coffee_charges.build(params[:coffee_charge])
    handle_transaction_request :on_error => lambda { 
      flash[:error] = @transaction.errors.full_messages
      redirect_to root_url 
    }
  end
end
