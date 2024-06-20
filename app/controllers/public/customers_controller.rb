class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
  @customer = current_customer
  end

  def edit
  @customer = current_customer
  end

  def update
  @customer = current_customer
    if  @customer.update(customer_params)
    redirect_to my_page_path
    else
      render :edit
    end
    
  def unsubscribe
  end
  
  def withdraw
    @customer = Customer.find(current_customer.id)
    # is_activeカラムをfalse に変更することにより削除フラグを立てる
    @customer.update(is_active :false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
 end
end