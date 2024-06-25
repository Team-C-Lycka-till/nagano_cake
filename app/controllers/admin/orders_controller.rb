class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    #@orders = Orders.all
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)

    if @order.status == 'comfirmed_payment'
      @order_details.update_all(making_status: 1)
    else
      redirect_to admin_order_path(@order)
    end
      
  end

private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :adress, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
