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
    end

  def unsubscribe
  end

  def withdraw
    @customer = current_customer
    @customer.is_active = false
    if @customer.save
      reset_session
      flash[:notice] = "退会処理を実行いたしました"
      redirect_to root_path
    end
  end
 end