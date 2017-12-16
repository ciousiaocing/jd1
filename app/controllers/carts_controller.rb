class CartsController < ApplicationController
  def clean
    current_cart.clean!
    flash[:warning] = "以清空購物車"
    redirect_to carts_path
  end

  def checkout
    @order = Order.new
  end
end
