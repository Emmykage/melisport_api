require 'test_helper'

class CourtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @court = courts(:one)
  end

  test 'should get index' do
    get courts_url, as: :json
    assert_response :success
  end

  test 'should create court' do
    assert_difference('Court.count') do
      post courts_url, params: { court: { address: @court.address, city: @court.city, state: @court.state } }, as: :json
    end

    assert_response :created
  end

  test 'should show court' do
    get court_url(@court), as: :json
    assert_response :success
  end

  test 'should update court' do
    patch court_url(@court), params: { court: { address: @court.address, city: @court.city, state: @court.state } },
                             as: :json
    assert_response :success
  end

  test 'should destroy court' do
    assert_difference('Court.count', -1) do
      delete court_url(@court), as: :json
    end

    assert_response :no_content
  end
end
