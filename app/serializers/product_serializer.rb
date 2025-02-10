class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :grip_sizes, :head_size, :rating, :length, :weight, :swing_weight, :stiffness, :composition,
             :description, :price, :ms_item_code, :image, :colour, :tension, :strung, :photo_urls, :product_quantity, :colours, :cloth_sizes, :ms_code, :description_body, :status, :player_type, :head_shape, :recommended_grip, :created_at, :new_product, :updated_at, :last_updated
  belongs_to :product_category
  belongs_to :gender
  belongs_to :level
  belongs_to :sport_category
  has_many :product_inventories

  def description_body
    object.description_body.to_s

  end

  def photo_urls
    object.photo_urls

  end



end