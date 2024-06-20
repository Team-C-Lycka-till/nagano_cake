class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    #@orders = Orders.all
    @order_details = @order.order_datils
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_datils
    if @order.update(order_params)
      @order_details.update_all(making_status: "製作待ち") if @order.status == "入金確認"
    end
      redirect_to admin_order_path(@order)
  end

private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :adress, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
