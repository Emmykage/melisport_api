class OrderDetailSerializer < ActiveModel::Serializer
  attributes :id, :total, :payment_method, :total_amount, :status, :billing_address, :order_number, :created_at, :viewed, :paid_at,  :orders_count
  # has_many :products
  has_many :order_items
  belongs_to :user
  has_one :billing_address
end
