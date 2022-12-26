require 'test_helper'

class PaymentShowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_show = payment_shows(:one)
  end

  test 'should get index' do
    get payment_shows_url, as: :json
    assert_response :success
  end

  test 'should create payment_show' do
    assert_difference('PaymentShow.count') do
      post payment_shows_url,
           params: { payment_show: { amount: @payment_show.amount, provider: @payment_show.provider, status: @payment_show.status } }, as: :json
    end

    assert_response :created
  end

  test 'should show payment_show' do
    get payment_show_url(@payment_show), as: :json
    assert_response :success
  end

  test 'should update payment_show' do
    patch payment_show_url(@payment_show),
          params: { payment_show: { amount: @payment_show.amount, provider: @payment_show.provider, status: @payment_show.status } }, as: :json
    assert_response :success
  end

  test 'should destroy payment_show' do
    assert_difference('PaymentShow.count', -1) do
      delete payment_show_url(@payment_show), as: :json
    end

    assert_response :no_content
  end
end
