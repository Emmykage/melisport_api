class Product < ApplicationRecord
  belongs_to :product_category
  belongs_to :gender, optional: true
  belongs_to :level, optional: true
  has_many :product_images
  has_many :cart_items
  has_many :shopping_carts, through: :cart_items
  has_many :sizes
  has_many :cloth_sizes
  has_many :shoe_sizes
  has_one_attached :picture

  accepts_nested_attributes_for :cloth_sizes
  accepts_nested_attributes_for :shoe_sizes

  validates :name, :description, :image, :price, presence: true
end
