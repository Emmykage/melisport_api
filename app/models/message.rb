class Message < ApplicationRecord
  validates :email, presence: true
end
