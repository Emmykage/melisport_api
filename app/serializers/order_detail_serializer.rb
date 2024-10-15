class OrderDetailSerializer < ActiveModel::Serializer
  attributes :id, :total, :total_amount
  has_many :order_items
  belongs_to :user
end
