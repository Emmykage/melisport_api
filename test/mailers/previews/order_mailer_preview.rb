# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/confirm_order
  def confirm_order
    OrderMailer.confirm_order
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/create_order
  def create_order
    OrderMailer.create_order
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/order_alert
  def order_alert
    OrderMailer.order_alert
  end

end
