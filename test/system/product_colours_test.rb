require 'application_system_test_case'

class ProductColoursTest < ApplicationSystemTestCase
  setup do
    @product_colour = product_colours(:one)
  end

  test 'visiting the index' do
    visit product_colours_url
    assert_selector 'h1', text: 'Product colours'
  end

  test 'should create product colour' do
    visit product_colours_url
    click_on 'New product colour'

    fill_in 'Colour', with: @product_colour.colour
    fill_in 'Product', with: @product_colour.product_id
    fill_in 'Quantity', with: @product_colour.quantity
    click_on 'Create Product colour'

    assert_text 'Product colour was successfully created'
    click_on 'Back'
  end

  test 'should update Product colour' do
    visit product_colour_url(@product_colour)
    click_on 'Edit this product colour', match: :first

    fill_in 'Colour', with: @product_colour.colour
    fill_in 'Product', with: @product_colour.product_id
    fill_in 'Quantity', with: @product_colour.quantity
    click_on 'Update Product colour'

    assert_text 'Product colour was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Product colour' do
    visit product_colour_url(@product_colour)
    click_on 'Destroy this product colour', match: :first

    assert_text 'Product colour was successfully destroyed'
  end
end
