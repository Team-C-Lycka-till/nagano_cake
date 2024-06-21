class Order < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> origin/develop
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: { waiting_for_payment: 0, comfirmed_payment: 1, in_production: 2, preparing_for_shipping: 3, shipped: 4 }

  validates :customer_id, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :shipping_cost, presence: true
  validates :total_payment, presence: true
  validates :payment_method, presence: true
  validates :status, presence: true

  SHIPPING_COST = 800

  def get_items_total_price
    items_total_price = 0
    order_details.each do |order_detail|
      items_total_price += order_detail.price
    end
    items_total_price
  end

  def get_total_amount
    total_amount = 0
    order_details.each do |order_detail|
      total_amount += order_detail.amount
    end
    total_amount
  end

  def get_shipping_cost
    SHIPPING_COST
  end

end
<<<<<<< HEAD
=======
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
>>>>>>> origin/develop
=======
>>>>>>> origin/develop
