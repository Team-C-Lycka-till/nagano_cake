# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
Admin.create!(
   email: 'aaa@aaa',
   password: 'aaaaaa'
)

Customer.create!(
   email: 'bbb@bbb',
   password: 'bbbbbb',
   last_name: 'b',
   first_name: 'b',
   last_name_kana: 'ビ',
   first_name_kana: 'ビ',
   postal_code: '1',
   address: 'b',
   telephone_number: '1'
)

Order.create!(
   customer_id: 1,
   postal_code: '1',
   address: 'address',
   name: 'b',
   total_payment: 1200,
   payment_method: 0
   )

5.times do |i|
  OrderDatil.create!(
     order_id: 1,
     item_id: i+1,
     price: 330,
     amount: 3
     )
end

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
