class ProductInventory < ApplicationRecord
  belongs_to :product

  validates :sku,  uniqueness: true, presence: true
  validates :quantity, presence: true

  after_update :update_product_total_amount, if: -> { saved_change_to_quantity? }

  def update_product_total_amount
    product.product_quantity = product.product_inventories.sum(:quantity)
    product.save
  end


end