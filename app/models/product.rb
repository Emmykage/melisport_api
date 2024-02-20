class Product < ApplicationRecord
  # serialize :cloth_sizes, Array
  has_one_attached :photo
  belongs_to :product_category
  belongs_to :gender, optional: true
  belongs_to :level, optional: true
  has_many :product_images
  has_many :cart_items
  has_many :shopping_carts, through: :cart_items
  

  validates :name, :description, :price, presence: true

  def photo_url
    Rails.application.routes.url_helpers.url_for(photo) if photo.attached?
  end
end