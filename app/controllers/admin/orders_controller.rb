class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(id: params[:id])
    @product_lists = @order.product_lists
  end
end
