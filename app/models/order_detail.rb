class OrderDetail < ApplicationRecord
  attr_accessor :current_user

  belongs_to :user, optional: true

  has_one :payment_detail
  has_many :order_items, dependent: :destroy
  has_one :billing_address, dependent: :destroy
  has_many :products, through: :order_items
  belongs_to :agent, optional: true

  has_one :invoice, dependent: :destroy
  accepts_nested_attributes_for :order_items
  accepts_nested_attributes_for :billing_address

  before_create :generate_number, :set_delivery_fee, :save_discount, :calculate_vat
  after_create :send_mail_notification
  before_destroy :is_authorized_to_destroy?

  before_update :set_delivery_fee, if: :saved_change_to_pick_up?

  after_update :send_confirmation_notification, if: :saved_change_to_status?
  after_save :calculate_net_total



  default_scope { order(created_at: :desc) }
  # Ex:- scope :active, -> {where(:active => true)}

  # enum :status, {pending: 0, approved: 1, declined: 2}
  enum :payment_method, { 'on_delivery' => 0, paystack: 1 }



  def send_confirmation_notification
    SendOrderConfirmationJob.perform_later(self)

  end


  def total_amount
    @total_amount ||= order_items.collect(&:price_order).sum
  end

  def is_authorized_to_destroy?
    unless   current_user&.role == 'super-admin'

    errors.add(:base, 'Not authorized to delete order.')
    throw(:abort)
    end
  end

  def save_discount
    self.discount = agent&.discount || 0
  end

  def orders_count
    order_items.count
  end

  def generate_number
    self.order_number = "555#{SecureRandom.random_number(10**5).to_s.rjust(5, '0')}-E"
  end

  def set_delivery_fee
    # assign delivery fee is pick up is true

    if pick_up
      self.delivery_fee = 0
    else
    fee = Delivery.find_by(state: billing_address&.state)
    self.delivery_fee = fee&.delivery_fee || 0
    end
  end

  def discounted_amount
    return 0 unless agent&.discount
     ((agent.discount.to_f / 100) * total_amount)
  end

  def calculate_vat
    self.vat = total_amount * 0.1
  end

 def calculate_net_total
  self.net_total =
    total_amount +
    (delivery_fee || 0) -
    (discounted_amount || 0)
end

  def send_mail_notification
    SendOrderNotificationJob.perform_later(self)
  end
end
