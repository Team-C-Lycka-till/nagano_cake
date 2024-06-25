class Admin::HomesController < ApplicationController
  #町田↓
  def top
    @orders = Order.all
  end
  #町田↑
end
