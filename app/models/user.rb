class User < ApplicationRecord
  has_secure_password
  has_many :shopping_carts
  has_many :cart_items, through: :shopping_carts
  has_many :user_payments
  has_many :addresses
  has_many :order_details

  validates :email, :username, presence: true, uniqueness: true
  # validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 6..20 }




  # validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50}
  # validates :email, presence: true,
  # uniqueness: { case_sensitive: false },
  # length: {maximum: 50}, format: { with: ConstantData::VALID_EMAIL_REGEX }, if: :method_name?
  # validates :phone_no, presence: true
end
