class Review < ApplicationRecord
  validates :content, presence: true
end
