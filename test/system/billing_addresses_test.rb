require "application_system_test_case"

class BillingAddressesTest < ApplicationSystemTestCase
  setup do
    @billing_address = billing_addresses(:one)
  end

  test "visiting the index" do
    visit billing_addresses_url
    assert_selector "h1", text: "Billing addresses"
  end

  test "should create billing address" do
    visit billing_addresses_url
    click_on "New billing address"

    fill_in "City", with: @billing_address.city
    fill_in "Email", with: @billing_address.email
    fill_in "Name", with: @billing_address.name
    fill_in "Order detail", with: @billing_address.order_detail_id
    fill_in "Phone no", with: @billing_address.phone_no
    fill_in "Postal code", with: @billing_address.postal_code
    fill_in "Street", with: @billing_address.street
    click_on "Create Billing address"

    assert_text "Billing address was successfully created"
    click_on "Back"
  end

  test "should update Billing address" do
    visit billing_address_url(@billing_address)
    click_on "Edit this billing address", match: :first

    fill_in "City", with: @billing_address.city
    fill_in "Email", with: @billing_address.email
    fill_in "Name", with: @billing_address.name
    fill_in "Order detail", with: @billing_address.order_detail_id
    fill_in "Phone no", with: @billing_address.phone_no
    fill_in "Postal code", with: @billing_address.postal_code
    fill_in "Street", with: @billing_address.street
    click_on "Update Billing address"

    assert_text "Billing address was successfully updated"
    click_on "Back"
  end

  test "should destroy Billing address" do
    visit billing_address_url(@billing_address)
    click_on "Destroy this billing address", match: :first

    assert_text "Billing address was successfully destroyed"
  end
end
