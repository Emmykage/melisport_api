class Product < ApplicationRecord
  belongs_to :product_category
  belongs_to :gender, optional: true
  belongs_to :level, optional: true
  has_many :product_images
  has_many :cart_items
  has_many :shopping_carts, through: :cart_items

  validates :name, :description, :image, :price, presence: true
end
