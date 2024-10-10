class Product < ApplicationRecord
  has_rich_text :description_body

  enum :status, {active: 0, inactive: 1}
  has_many_attached :photos
  belongs_to :product_category
  belongs_to :sport_category, optional: true

  belongs_to :gender, optional: true
  belongs_to :level, optional: true
  has_many :product_images
  has_many :cart_items
  has_many :shopping_carts, through: :cart_items


  validates :name, :description_body, :sku, :ms_code, presence: true
  validates :ms_code, uniqueness: true
  validates :price, presence: true,  if: :is_active?










  def new_product
   created_at >= 30.days.ago
  end


  def photo_urls
    photos.map do |photo|
    Rails.application.routes.url_helpers.url_for(photo)

    end if photos.attached?
  end


  private

  def is_active?
    # status == "active"

  end


end