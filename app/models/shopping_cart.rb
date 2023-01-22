class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :products, through: :cart_items

  def total
    cart_items.to_a.sum {|item| item.total}
  end

  # def subTotal
  #   cart_items.collect { |cart_item| cart_item.valid? ? cart_item.product.price * cart_item.quantity : 0 }.sum
  # end

  # private

  # def set_subtotal
  #   self[:subtotal] = subTotal
  # end
end
