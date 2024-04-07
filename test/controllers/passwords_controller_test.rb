require "test_helper"

class PasswordsControllerTest < ActionDispatch::IntegrationTest
  test "should get reset_password" do
    get passwords_reset_password_url
    assert_response :success
  end
end
