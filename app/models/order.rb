class Order < ApplicationRecord
  #町田↓
    belongs_to :customer
    has_many :order_datils

    enum payment_method: { "クレジットカード": 0, "銀行振込": 1 }
    enum status: { "入金待ち":0, "入金確認":1, "製作中":2, "発送準備中":3, "発送済み":4 }

  def set_date
    created_at.strftime("%Y/%m/%d %H:%M:%S")
  end

  def total_item_amount #商品合計金額
    order_datils.sum { |order_detail| order_detail.price }
  end

  def total_item_tax
    order_datils.sum { |order_detail| order_detail.amount }
  end

  #町田↑
end