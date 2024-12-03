class OrderDetailSerializer < ActiveModel::Serializer
  attributes :id, :total, :payment_method, :total_amount, :status, :billing_address, :order_number, :created_at, :viewed, :paid_at, :delivery_fee, :orders_count, :net_total
  # has_many :products
  has_many :order_items
  belongs_to :user
  has_one :billing_address
end
