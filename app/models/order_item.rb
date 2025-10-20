class OrderItem < ApplicationRecord
  belongs_to :order_detail
  belongs_to :product

  validates :amount, :quantity, presence: true


  def price_order
    amount * quantity
  end

  def photo_url
    # product.photo_urls.first
    product&.photo_urls&.first
  end
end
