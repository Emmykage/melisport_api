class User < ApplicationRecord
  has_secure_password
  has_many :shopping_carts
  has_many :cart_items, through: :shopping_carts
  has_many :user_payments
  has_many :addresses
  has_many :order_details
  

  validates :email, :first_name, :last_name, presence: true, uniqueness: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 6..20 }

  def full_name
   full_name =  self.first_name + ' ' + self.last_name
  end

end
