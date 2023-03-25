class Product < ApplicationRecord
  belongs_to :product_category
  belongs_to :gender
  has_many :product_images
  has_many :cart_items
  has_many :shopping_carts, through: :cart_items

  validates :name, :description, :image, presence: true
end
