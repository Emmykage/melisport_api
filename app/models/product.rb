class Product < ApplicationRecord
  has_rich_text :description_body
  has_many_attached :photos

  enum :status, {active: 0, inactive: 1}
  belongs_to :product_category
  belongs_to :sport_category, optional: true

  belongs_to :gender, optional: true
  belongs_to :level, optional: true
  has_many :product_images
  has_many :cart_items
  has_many :shopping_carts, through: :cart_items


  validates :name, :description_body, presence: true
  validates :ms_code, uniqueness: true, presence: true, if: :is_active?
  validates :price, :sku,  presence: true,  if: :is_active?










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
    status == "active"

  end

# safer method
# The second method is safer and more robust. It ensures that you're only trying to generate URLs for photos that are actually persisted in the database. If some photos fail to save or are still in an invalid state, they will be skipped.
  # def photo_urls
  #   photos.map do |photo|
  #     Rails.application.routes.url_helpers.rails_blob_url(photo, only_path: true) if photo.persisted?
  #   end.compact
  # end


end
