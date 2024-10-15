class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :amount, :product
  # belongs_to :product
end
