class CartItemSerializer < ActiveModel::Serializer
  attributes :id, :product_id, :quantity, :total
  belongs_to :product
end
