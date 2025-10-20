class Delivery < ApplicationRecord
  validates :state, :city, :delivery_fee, presence: true
end
