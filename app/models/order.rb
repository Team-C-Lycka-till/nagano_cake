class Order < ApplicationRecord
  #町田↓
    belongs_to :customer
    has_many :order_details
  #町田↑
end