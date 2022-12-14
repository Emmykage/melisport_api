class OrderDetail < ApplicationRecord
  belongs_to :user
  belongs_to :payment_detail
end
