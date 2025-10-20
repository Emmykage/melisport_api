require 'test_helper'

class ProductColoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_colour = product_colours(:one)
  end

  test 'should get index' do
    get product_colours_url
    assert_response :success
  end

  test 'should get new' do
    get new_product_colour_url
    assert_response :success
  end

  test 'should create product_colour' do
    assert_difference('ProductColour.count') do
      post product_colours_url,
           params: { product_colour: { colour: @product_colour.colour, product_id: @product_colour.product_id,
                                       quantity: @product_colour.quantity } }
    end

    assert_redirected_to product_colour_url(ProductColour.last)
  end

  test 'should show product_colour' do
    get product_colour_url(@product_colour)
    assert_response :success
  end

  test 'should get edit' do
    get edit_product_colour_url(@product_colour)
    assert_response :success
  end

  test 'should update product_colour' do
    patch product_colour_url(@product_colour),
          params: { product_colour: { colour: @product_colour.colour, product_id: @product_colour.product_id,
                                      quantity: @product_colour.quantity } }
    assert_redirected_to product_colour_url(@product_colour)
  end

  test 'should destroy product_colour' do
    assert_difference('ProductColour.count', -1) do
      delete product_colour_url(@product_colour)
    end

    assert_redirected_to product_colours_url
  end
end
