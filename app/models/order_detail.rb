class OrderDetail < ApplicationRecord
  accepts_nested_attributes_for :order_items

  belongs_to :user
  has_one :payment_detail
  has_many :order_items

  enum :status, {pending: 0, approved: 1, declined: 2}





  def total_amount
    order_items.collect{|item| item.price_order}.sum

  end

end
