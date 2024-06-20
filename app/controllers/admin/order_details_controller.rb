class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDatil.find(params[:id])
    @order = @order_detail.order 
    @order_details = @order.order_datils 
    is_updated = true 
    if @order_detail.update(order_detail_params)
       @order.update(status: "製作中") if @order_detail.making_status == "製作中" 
       @order_details.each do |order_detail| 
        if order_detail.making_status != "製作完了"
          is_updated = false
        end
       end
       @order.update(status: "発送準備中") if is_updated
    end
      redirect_to admin_order_path(@order_detail.order), notice: '注文ステータスが更新されました'
    #else
      #render request.referer
    #end
  end

private

  def order_detail_params
    params.require(:order_datil).permit(:order_id, :item_id, :price_id, :amount_id, :making_status)
  end

end
