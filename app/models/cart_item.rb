class CartItem < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :product

  validates :product_id, uniqueness: { scope: :shopping_cart_id}
  # validates :product_id, uniqueness: true
  # before_save :set_unit_price
  # before_action :set_total

  def total
    product.price * quantity
  end

  # def unit_price
  #   if persisted?
  #     # self[:product.price]
  #     self[:price]

  #   else
  #     product.price
  #   end
  # end

  # def total
  #   unit_price * quantity
  # end

  # private

  # def set_unit_price
  #   self[:price]
  # end

  # def set_total
  #   self[:total] = total * quantity
  # end
end
