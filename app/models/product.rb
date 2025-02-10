class Product < ApplicationRecord
  has_rich_text :description_body
  has_many_attached :photos

  after_commit :clear_cache, om: [:create, :update, :destroy ]
  before_save :update_quantity

  enum :status, {active: 0, inactive: 1}
  belongs_to :product_category
  belongs_to :sport_category, optional: true

  belongs_to :gender, optional: true
  belongs_to :level, optional: true
  has_many :product_inventories
  has_many :cart_items
  has_many :shopping_carts, through: :cart_items
  has_many :order_items
  has_many :order_details, through: :order_items
  has_many :product_colours, dependent: :destroy
  validates :name, :description_body, presence: true
  validates :ms_item_code, uniqueness: true, presence: true, if: :is_active?
  validates :price, :ms_code,  presence: true,  if: :is_active?

  # accepts_nested_attributes_for :shoe_sizes
  accepts_nested_attributes_for :product_colours
  accepts_nested_attributes_for :product_inventories, allow_destroy: true

def clear_cache
  Rails.cache.delete("products/all")

end


  def new_product
   created_at >= 30.days.ago
  end
  def last_updated
    return "Now" if updated_at >= 10.minutes.ago
    return "Today" if updated_at >= 1.day.ago
    return "Yesterday" if updated_at >= 2.days.ago
    return "#{(Time.current.to_date - updated_at.to_date).to_i} days ago" if updated_at >= 1.week.ago
    return "This week" if updated_at >= 2.weeks.ago
    return "Last week" if updated_at >= 1.month.ago
    return "This month" if updated_at >= 2.months.ago
    return nil
    # return "Last month" if updated_at >= 1.year.ago
    # updated_at.strftime("%b %d, %Y") # Format for older dates
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

  def update_quantity
    self.product_quantity = product_inventories.to_a.sum(&:quantity) if product_inventories.any?
  end


# safer method
# The second method is safer and more robust. It ensures that you're only trying to generate URLs for photos that are actually persisted in the database. If some photos fail to save or are still in an invalid state, they will be skipped.
  # def photo_urls
  #   photos.map do |photo|
  #     Rails.application.routes.url_helpers.rails_blob_url(photo, only_path: true) if photo.persisted?
  #   end.compact
  # end


end
