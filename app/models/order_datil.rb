class OrderDatil < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> origin/develop
  belongs_to :order
  belongs_to :item

  enum making_status: { unable_manufacture: 0, waiting_for_manufacture: 1, in_production: 2, production_completed: 3 }

  validates :order_id, presence: true
  validates :item_id, presence: true
  validates :price, presence: true
  validates :amount, presence: true
  validates :making_status, presence: true

  def get_subtotal
    item.add_tax_price * amount
  end
<<<<<<< HEAD
=======
  #町田↓
  belongs_to :item
  belongs_to :order

  enum making_status: {"製作不可":0,"製作待ち":1,"製作中":2,"製作完了":3}

  def total_item #税込価格
    price * amount
  end

  #町田↑
>>>>>>> origin/develop
end
=======
>>>>>>> origin/develop
