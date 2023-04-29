class OrderDetailSerializer < ActiveModel::Serializer
  attributes :id, :total
  has_many :order_items
end
