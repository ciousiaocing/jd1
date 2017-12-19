class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price

    if @order.save
      current_cart.cart_items.each do |cart_item|
        product_list = ProductList.new
        product_list.order_id = @order.id
        product_list.product_name = cart_item.product.title
        product_list.product_price = cart_item.product.price
        product_list.quantity = cart_item.quantity
        product_list.save
      end

      redirect_to order_path(@order.token)
    else
      render 'carts/checkout'
    end
  end

  def show
    @order = Order.find_by_token(params[:id])
    @product_lists = @order.product_lists

    @client_token = Braintree::ClientToken.generate

  end

  def checkout_with_braintree
    @order = Order.find_by_token(params[:id])
    @order.set_payment_with!("braintree")

    #刷卡
    if @order
      nonce = params[:payment_method_nonce]

      result = Braintree::Transaction.sale(
        amount: @order.total,
        payment_method_nonce: nonce
      )

      if result
        redirect_to order_path(@order.token), notice: "braintree完成付款"
        @order.make_payment!
        current_cart.clean!

      else
        redirect_to order_path(@order.token)
        flash[:notice] = "刷卡失敗"
      end
    else
      redirect_to order_path(@order.token)
      flash[:notice] = "支付系統故障，請傷後再試"

    end

  end

  private

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
