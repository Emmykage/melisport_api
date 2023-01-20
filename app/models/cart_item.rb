class CartItem < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :product
  before_save :set_unit_price
  # before_action :set_total

  def unit_price
    if persisted?
      self[:product.price]
    else
      product.price
    end
  end

  def total 
    unit_price * quantity
  end

  private

  def set_unit_price
    self[:product.price]
  end

  def set_total
    self[:total] = total * quantity
  end
end
