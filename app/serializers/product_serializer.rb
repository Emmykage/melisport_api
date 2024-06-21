class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :grip_sizes, :head_size, :rating, :length, :weight, :swing_weight, :stiffness, :composition,
             :description, :price, :sku, :image, :colour, :tension, :strung, :photo_urls, :quantity, :colours, :cloth_sizes, :shoe_sizes, :ms_code
  belongs_to :product_category
  belongs_to :gender
  belongs_to :level

end