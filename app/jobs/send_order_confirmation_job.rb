class SendOrderConfirmationJob < ApplicationJob
  queue_as :default

  def perform(order)

    OrderMailer.confirm_order(order).deliver_later
  end
end
