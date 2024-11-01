require "test_helper"

class BillingAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @billing_address = billing_addresses(:one)
  end

  test "should get index" do
    get billing_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_billing_address_url
    assert_response :success
  end

  test "should create billing_address" do
    assert_difference("BillingAddress.count") do
      post billing_addresses_url, params: { billing_address: { city: @billing_address.city, email: @billing_address.email, name: @billing_address.name, order_detail_id: @billing_address.order_detail_id, phone_no: @billing_address.phone_no, postal_code: @billing_address.postal_code, street: @billing_address.street } }
    end

    assert_redirected_to billing_address_url(BillingAddress.last)
  end

  test "should show billing_address" do
    get billing_address_url(@billing_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_billing_address_url(@billing_address)
    assert_response :success
  end

  test "should update billing_address" do
    patch billing_address_url(@billing_address), params: { billing_address: { city: @billing_address.city, email: @billing_address.email, name: @billing_address.name, order_detail_id: @billing_address.order_detail_id, phone_no: @billing_address.phone_no, postal_code: @billing_address.postal_code, street: @billing_address.street } }
    assert_redirected_to billing_address_url(@billing_address)
  end

  test "should destroy billing_address" do
    assert_difference("BillingAddress.count", -1) do
      delete billing_address_url(@billing_address)
    end

    assert_redirected_to billing_addresses_url
  end
end
