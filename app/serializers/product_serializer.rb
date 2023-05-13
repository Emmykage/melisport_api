class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :grip_size, :head_size, :rating, :length, :weight, :swing_weight, :stiffness, :composition,
             :description, :price, :sku, :image, :colour, :tension, :size, :strung
  belongs_to :product_category
  belongs_to :gender
  belongs_to :level
  has_many :cloth_sizes
  has_many :shoe_sizes
end
