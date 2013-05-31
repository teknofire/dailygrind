class TransactionsController < ApplicationController
  before_filter :require_login
  
  def new
    @transaction = Transaction.new
  end
  
  def create
    @transaction = current_user.transactions.build(params[:transaction])
    handle_transaction_request
  end
  
  def add_funds
    @transaction = Transaction.new
  end
  
  def caffinate
    
  end
  
  protected
  
  def handle_transaction_request(opts = {})
    opts[:on_error] ||= lambda { render :action => 'new' }
    opts[:on_success] ||= lambda { redirect_to root_url(caffinated: true) }
    @caffinated = true
    
    helpers = Object.new.extend(ActionView::Helpers::NumberHelper)
    if @transaction.save
      respond_to do |format|
        format.html {
          if @transaction.amount > 0
            flash[:success] = "Added #{helpers.number_to_currency(@transaction.amount)} to your funds"
          else
            flash[:success] = "Deducted #{helpers.number_to_currency(@transaction.amount)} from your funds"
          end
          opts[:on_success].call
        }
      end
    else
      respond_to do |format|
        format.html { 
          opts[:on_error].call
        }
      end
    end
  end
end
