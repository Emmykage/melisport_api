require "application_system_test_case"

class ShoeSizesTest < ApplicationSystemTestCase
  setup do
    @shoe_size = shoe_sizes(:one)
  end

  test "visiting the index" do
    visit shoe_sizes_url
    assert_selector "h1", text: "Shoe sizes"
  end

  test "should create shoe size" do
    visit shoe_sizes_url
    click_on "New shoe size"

    fill_in "Quantity", with: @shoe_size.quantity
    fill_in "Size", with: @shoe_size.size
    click_on "Create Shoe size"

    assert_text "Shoe size was successfully created"
    click_on "Back"
  end

  test "should update Shoe size" do
    visit shoe_size_url(@shoe_size)
    click_on "Edit this shoe size", match: :first

    fill_in "Quantity", with: @shoe_size.quantity
    fill_in "Size", with: @shoe_size.size
    click_on "Update Shoe size"

    assert_text "Shoe size was successfully updated"
    click_on "Back"
  end

  test "should destroy Shoe size" do
    visit shoe_size_url(@shoe_size)
    click_on "Destroy this shoe size", match: :first

    assert_text "Shoe size was successfully destroyed"
  end
end
