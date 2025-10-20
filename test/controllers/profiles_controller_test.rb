require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
  end

  test 'should get index' do
    get profiles_url, as: :json
    assert_response :success
  end

  test 'should create profile' do
    assert_difference('Profile.count') do
      post profiles_url, params: { profile: { address: @profile.address, state: @profile.state } }, as: :json
    end

    assert_response :created
  end

  test 'should show profile' do
    get profile_url(@profile), as: :json
    assert_response :success
  end

  test 'should update profile' do
    patch profile_url(@profile), params: { profile: { address: @profile.address, state: @profile.state } }, as: :json
    assert_response :success
  end

  test 'should destroy profile' do
    assert_difference('Profile.count', -1) do
      delete profile_url(@profile), as: :json
    end

    assert_response :no_content
  end
end
