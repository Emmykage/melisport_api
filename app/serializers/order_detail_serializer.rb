class OrderDetailSerializer < ActiveModel::Serializer
  attributes :id, :total
  has_many :order_items
  belongs_to :user
end
