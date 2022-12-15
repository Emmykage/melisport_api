class Product < ApplicationRecord
  belongs_to :product_category
  has_many :product_images
end
