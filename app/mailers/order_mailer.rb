class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail to: @user.email, subject: "感謝您完成本次下單，以下是您的購物明細#{@order.token}"
  end

  def say_hello_to(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail to:@user.email, subject:"你好！"
  end
end
