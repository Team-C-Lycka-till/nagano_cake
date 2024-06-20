class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #町田↓
  def set_date
    created_at.strftime("%Y/%m/%d %H:%M:%S")
  end
  #町田↑
end
