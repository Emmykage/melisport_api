class UserMailer < ApplicationMailer
  # default from: 'info@melisports.com'

  def confirmation_email(user)
    # @user = params[:user]
    @user = user
    # @url = 'http://melisports.com/login'
    @url = confirmation_url(user.confirmation_token)


    mail(to: @user.email, subject: 'Complete Email Sign up.. Welcome to Melisports Tennis.')
  end

  def password_reset_email(user)
    @user = user
    @url = password_reset_url(user)
    mail(to: @user.email, subject: 'Password Reset')
  end

  def login_notification(user)
    @user = user
    @email = user.email

    mail(to: @user.email, subject: 'Login in Notification')
  end

  def order_notification_email(order)
    @order = order
    @full_name = order.billing_address.name
    @email = order.billing_address.email
    org_email = "info@melisports.com"
    mail(to: org_email, subject: 'Order Request Notification')
  end
   def order_confirmation_email(order)
    @order = order
    @full_name = order.billing_address.name
    @email = order.billing_address.email
    mail(to: @email, subject: 'Order Confirmation')
  end

  def confirmation_url(confirmation_token)
    "#{Rails.application.config.action_mailer.default_url_options[:host]}/confirm_email?confirmation_token=#{confirmation_token}"
  end

  def password_reset_url(user)
    "#{Rails.application.config.action_mailer.default_url_options[:host]}/reset_password?password_token=#{user.reset_password_token}&user_email=#{user.email}"
  end
end
