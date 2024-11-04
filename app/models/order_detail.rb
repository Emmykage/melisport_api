class OrderDetail < ApplicationRecord

  belongs_to :user, optional: true
  has_one :payment_detail
  has_many :order_items
  has_one :billing_address
  has_many :products, through: :order_items
  accepts_nested_attributes_for :order_items
  accepts_nested_attributes_for :billing_address

  before_save :generate_invoice
  # enum :status, {pending: 0, approved: 1, declined: 2}
  enum :payment_method, {"pay later" => 0, paypal: 1 }

  def total_amount
    order_items.collect{|item| item.price_order}.sum
  end


  def generate_invoice
    self.invoice_number = "555#{SecureRandom.random_number(10**5).to_s.rjust(5, '0')}-E"

  end

end