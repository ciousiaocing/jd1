class Admin::ProductsController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @products = Product.all.order("position ASC")
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: "Create Success"
    else
      @categories = Category.all
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path, notice: "Update Success"
    else
      @categories = Category.all
      render :edit
    end
  end

  def delete
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products, notice: "Delete Success"
  end

  def move_up
    @product = Product.find(params[:id])
    @product.move_higher
    redirect_to admin_products_path
  end

  def move_down
    @product = Product.find(params[:id])
    @product.move_lower
    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :image, :category_id)
  end
end
