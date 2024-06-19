class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDatil.find(params[:id])
    if @order_detail.update(order_detail_params)
      redirect_to admin_order_path(@order.id), notice: '注文ステータスが更新されました'
    else
      render request.referer
    end
  end

private

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price_id, :amount_id, :making_status)
  end

end
