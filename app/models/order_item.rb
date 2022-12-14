class OrderItem < ApplicationRecord
  belongs_to :order_detail
  belongs_to :product
end
