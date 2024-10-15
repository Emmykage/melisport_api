class OrderItem < ApplicationRecord
  belongs_to :order_detail
  belongs_to :product

  validates :amount, :quantity, presence: true


  def price_order
    amount * quantity
  end

end