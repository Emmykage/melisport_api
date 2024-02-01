class User < ApplicationRecord
  has_secure_password
  has_many :shopping_carts, dependent: :destroy
  has_many :cart_items, through: :shopping_carts
  has_many :user_payments
  has_many :addresses
  has_many :order_details
  
  # validates :email, uniqueness: true, format: { with: /\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,})+\z/i, message: ":Please enter a valid email address."}

  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 6..20 }

  def full_name
   full_name =  self.first_name + ' ' + self.last_name
  end

end
