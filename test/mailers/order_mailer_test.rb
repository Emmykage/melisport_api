require "test_helper"

class OrderMailerTest < ActionMailer::TestCase
  test "confirm_order" do
    mail = OrderMailer.confirm_order
    assert_equal "Confirm order", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "create_order" do
    mail = OrderMailer.create_order
    assert_equal "Create order", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "order_alert" do
    mail = OrderMailer.order_alert
    assert_equal "Order alert", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
