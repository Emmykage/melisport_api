require 'application_system_test_case'

class ColoursTest < ApplicationSystemTestCase
  setup do
    @colour = colours(:one)
  end

  test 'visiting the index' do
    visit colours_url
    assert_selector 'h1', text: 'Colours'
  end

  test 'should create colour' do
    visit colours_url
    click_on 'New colour'

    fill_in 'Quantity', with: @colour.quantity
    fill_in 'Size', with: @colour.size
    click_on 'Create Colour'

    assert_text 'Colour was successfully created'
    click_on 'Back'
  end

  test 'should update Colour' do
    visit colour_url(@colour)
    click_on 'Edit this colour', match: :first

    fill_in 'Quantity', with: @colour.quantity
    fill_in 'Size', with: @colour.size
    click_on 'Update Colour'

    assert_text 'Colour was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Colour' do
    visit colour_url(@colour)
    click_on 'Destroy this colour', match: :first

    assert_text 'Colour was successfully destroyed'
  end
end
