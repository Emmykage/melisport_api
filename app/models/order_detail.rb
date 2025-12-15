class OrderDetail < ApplicationRecord
  belongs_to :user, optional: true
  has_one :payment_detail
  has_many :order_items, dependent: :destroy
  has_one :billing_address, dependent: :destroy
  has_many :products, through: :order_items
  belongs_to :agent, optional: true

  has_one :invoice
  accepts_nested_attributes_for :order_items
  accepts_nested_attributes_for :billing_address

  before_create :generate_number, :set_delivery_fee, :save_discount, :calculate_vat


  default_scope { order(created_at: :desc)}
  # Ex:- scope :active, -> {where(:active => true)}

  # enum :status, {pending: 0, approved: 1, declined: 2}
  enum :payment_method, { 'pay later' => 0, paystack: 1 }

  def total_amount
    order_items.collect(&:price_order).sum
  end

  def save_discount
    self.discount = agent.discount
  end

  def orders_count
    order_items.count
  end

  def generate_number
    self.order_number = "555#{SecureRandom.random_number(10**5).to_s.rjust(5, '0')}-E"
  end

  def set_delivery_fee
    fee = Delivery.find_by(state: billing_address.state)
    self.delivery_fee = fee['delivery_fee']
  end

  def discounted_amount
   self.bonus = ((agent.discount.to_i  / 100) * total_amount) || 0
  end

  def calculate_vat
    self.vat = total_amount * 0.1
  end

  def calculate_net_total
    total_amount + delivery_fee + sub_total - discounted_Amount
  end
end
