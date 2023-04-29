class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :product
  belongs_to :product
end
