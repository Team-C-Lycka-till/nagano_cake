class Address < ApplicationRecord
  belongs_to :customer #寺田↓

  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true    #寺田↑
end
