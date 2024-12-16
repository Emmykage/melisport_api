class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :grip_sizes, :head_size, :rating, :length, :weight, :swing_weight, :stiffness, :composition,
             :description, :price, :sku, :image, :colour, :tension, :strung, :photo_urls, :quantity, :colours, :cloth_sizes, :shoe_sizes, :ms_code, :description_body, :status, :player_type, :head_shape, :recommended_grip, :created_at, :new_product, :total_qty
  belongs_to :product_category
  belongs_to :gender
  belongs_to :level
  belongs_to :sport_category
  has_many :order_items
  has_many :shoe_sizes
  # has_many

  def description_body
    object.description_body.to_s

  end

  def photo_urls
    object.photo_urls

  end



end