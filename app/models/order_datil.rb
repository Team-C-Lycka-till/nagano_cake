class OrderDatil < ApplicationRecord
  #町田↓
  belongs_to :item
  belongs_to :order

  enum making_status: {"製作不可":0,"製作待ち":1,"製作中":2,"製作完了":3}

  def total_item #税込価格
    price * amount
  end

  #町田↑
end
