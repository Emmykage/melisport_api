class ProductColourSerializer < ActiveModel::Serializer
  attributes :id, :colour, :quantity
  has_one :product
end
