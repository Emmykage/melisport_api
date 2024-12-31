class ProductInventory < ApplicationRecord
  belongs_to :product

  validates :sku,  uniqueness: true, presence: true
  validates :quantity, presence: true

end