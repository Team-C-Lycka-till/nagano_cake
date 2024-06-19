class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDatil.all
  end

  def update
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
    if @order.update(order_params)
      redirect_to admin_order_path(@order), notice: '注文ステータス'
    else
      render :show
    end
  end

private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :adress, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
