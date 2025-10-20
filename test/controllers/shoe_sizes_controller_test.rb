require 'test_helper'

class ShoeSizesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shoe_size = shoe_sizes(:one)
  end

  test 'should get index' do
    get shoe_sizes_url
    assert_response :success
  end

  test 'should get new' do
    get new_shoe_size_url
    assert_response :success
  end

  test 'should create shoe_size' do
    assert_difference('ShoeSize.count') do
      post shoe_sizes_url, params: { shoe_size: { quantity: @shoe_size.quantity, size: @shoe_size.size } }
    end

    assert_redirected_to shoe_size_url(ShoeSize.last)
  end

  test 'should show shoe_size' do
    get shoe_size_url(@shoe_size)
    assert_response :success
  end

  test 'should get edit' do
    get edit_shoe_size_url(@shoe_size)
    assert_response :success
  end

  test 'should update shoe_size' do
    patch shoe_size_url(@shoe_size), params: { shoe_size: { quantity: @shoe_size.quantity, size: @shoe_size.size } }
    assert_redirected_to shoe_size_url(@shoe_size)
  end

  test 'should destroy shoe_size' do
    assert_difference('ShoeSize.count', -1) do
      delete shoe_size_url(@shoe_size)
    end

    assert_redirected_to shoe_sizes_url
  end
end
