class OrderDetailSerializer < ActiveModel::Serializer
  attributes :id, :total, :payment_method, :total_amount, :status, :billing_address, :order_number, :created_at, :discount,
             :viewed, :paid_at, :delivery_fee, :orders_count, :net_total, :referral_code, :sub_total, :vat, :bonus, :calculate_net_total
  # has_many :products
  has_many :order_items
  belongs_to :user
  has_one :billing_address
  has_one :invoice
end
