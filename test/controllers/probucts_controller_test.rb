require "test_helper"

class ProbuctsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @probuct = probucts(:one)
  end

  test "should get index" do
    get probucts_url, as: :json
    assert_response :success
  end

  test "should create probuct" do
    assert_difference("Probuct.count") do
      post probucts_url, params: { probuct: { description: @probuct.description, name: @probuct.name, price: @probuct.price, product_category_id: @probuct.product_category_id } }, as: :json
    end

    assert_response :created
  end

  test "should show probuct" do
    get probuct_url(@probuct), as: :json
    assert_response :success
  end

  test "should update probuct" do
    patch probuct_url(@probuct), params: { probuct: { description: @probuct.description, name: @probuct.name, price: @probuct.price, product_category_id: @probuct.product_category_id } }, as: :json
    assert_response :success
  end

  test "should destroy probuct" do
    assert_difference("Probuct.count", -1) do
      delete probuct_url(@probuct), as: :json
    end

    assert_response :no_content
  end
end
