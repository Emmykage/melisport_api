class SendOrderNotificationJob < ApplicationJob
  queue_as :default

  def perform(order)
    # UserMailer.order_notification_email(order).deliver_later
    UserMailer.order_notification_email(order).deliver_later
  UserMailer.order_confirmation_email(order).deliver_later
    # Do something later
  end
end
