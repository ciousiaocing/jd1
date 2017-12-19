class Admin::OrdersController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @orders = Order.order("id DESC")
  end

  def show
    @order = Order.find_by(id: params[:id])
    @product_lists = @order.product_lists
  end

  def ship
    @order = Order.find_by(id: params[:id])
    OrderMailer.notify_ship(@order).deliver!
    @order.ship!
    redirect_back(fallback_location: root_path)
  end

  def delivering
    @order = Order.find_by(id: params[:id])
    @order.delivering!
    redirect_back(fallback_location: root_path)
  end

  def return
    @order = Order.find_by(id: params[:id])
    @order.return!
    redirect_back(fallback_location: root_path)
  end

  def refund
    @order = Order.find_by(id: params[:id])
    @order.refund!
    redirect_back(fallback_location: root_path)
  end
end
