class OrderDatil < ApplicationRecord
  #町田↓
  belongs_to :item
  belongs_to :order

  #町田↑
end
