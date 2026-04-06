class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.confirm_order.subject
  #
  def confirm_order(order)


   @order = order
   @status = order.status
    @full_name = order.billing_address.name
    @email = order.billing_address.email
    mail(to: @email, subject: 'Order Confirmed')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.create_order.subject
  #
  def create_order
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_alert.subject
  #
  def order_alert
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
