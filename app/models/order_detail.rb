class OrderDetail < ApplicationRecord

  belongs_to :user, optional: true
  has_one :payment_detail
  has_many :order_items, dependent: :destroy
  has_one :billing_address, dependent: :destroy
  has_many :products, through: :order_items
  accepts_nested_attributes_for :order_items
  accepts_nested_attributes_for :billing_address

  before_create :generate_number
  # enum :status, {pending: 0, approved: 1, declined: 2}
  enum :payment_method, {"pay later" => 0, paypal: 1 }

  def total_amount
    order_items.collect{|item| item.price_order}.sum
  end


  def orders_count
    order_items.count
  end


  def generate_number
    self.order_number = "555#{SecureRandom.random_number(10**5).to_s.rjust(5, '0')}-E"

  end

end