class Product < ApplicationRecord
  # serialize :cloth_sizes, Array
  has_one_attached :photo
  belongs_to :product_category
  belongs_to :gender, optional: true
  belongs_to :level, optional: true
  has_many :product_images
  has_many :cart_items
  has_many :shopping_carts, through: :cart_items
  has_many :product_sizes, dependent: :destroy
  
  accepts_nested_attributes_for :product_sizes, allow_destroy: true

  validates :name, :description, :image, :price, presence: true

  def photo_url
    Rails.application.routes.url_helpers.url_for(photo) if photo.attached?
  end
end