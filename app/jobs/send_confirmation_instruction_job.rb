class SendConfirmationInstructionJob < ApplicationJob
  queue_as :default

  def perform(user)
    # Do something later
    UserMailer.confirmation_email(user).deliver_now
  end
end
