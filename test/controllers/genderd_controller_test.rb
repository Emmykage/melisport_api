require "test_helper"

class GenderdControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get genderd_index_url
    assert_response :success
  end
end
