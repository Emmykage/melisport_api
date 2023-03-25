class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :grip_size, :head_size, :rating, :length, :weight, :swing_weight, :stiffness, :composition,
             :description, :price, :sku, :image
  belongs_to :product_category
  belongs_to :gender
end
