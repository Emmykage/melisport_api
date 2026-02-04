class SendLoginNotificationJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later
    UserMailer.login_notification(user).deliver_later
  end
end
