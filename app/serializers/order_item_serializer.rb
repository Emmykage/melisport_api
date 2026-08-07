class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :amount, :product, :photo_url, :size, :sku, :bonus 
  belongs_to :product, serializer: ProductSerializer
  belongs_to :order_detail
end
