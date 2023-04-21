require "test_helper"

class GendersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get genders_index_url
    assert_response :success
  end
end
