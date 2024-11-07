class OrderDetailSerializer < ActiveModel::Serializer
  attributes :id, :total, :payment_method, :total_amount, :status, :billing_address, :invoice_number, :created_at
  # has_many :products
  has_many :order_items
  belongs_to :user
  has_one :billing_address
end
