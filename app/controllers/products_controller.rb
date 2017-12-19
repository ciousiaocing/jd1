class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:add_to_cart]

  def index
    @products = Product.all.order("position ASC")
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])

    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "成功將#{@product.title}加入購物車"
    else
      flash[:warning] = "購物車內已有此物品"
    end

    redirect_to product_path
  end

  def collect
    @product = Product.find(params[:id])

    if !current_user.has_collected?(@product)
      current_user.collect!(@product)
      flash[:notice] = "You've successfully collected the skill!"
    else
      flash[:warning] = "You've already collected the skill!"
    end

    redirect_to product_path(@product)
  end

  def discollect
    @product = Product.find(params[:id])

    if current_user.has_collected?(@product)
      current_user.discollect!(@product)
      flash[:alert] = "You've successfully discollected the skill!"
    else
      flash[:warning] = "You haven't collected the skill yet!"
    end

    redirect_to product_path(@product)
  end
end
