class ProductCategory < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, :description, presence: true, uniqueness: true

end
