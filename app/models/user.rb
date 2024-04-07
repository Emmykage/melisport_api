class User < ApplicationRecord
  has_secure_password
  has_many :shopping_carts, dependent: :destroy
  has_many :cart_items, through: :shopping_carts
  has_many :user_payments
  has_many :addresses
  has_many :order_details

  before_create :generate_confirmation_token
  after_create :send_confirmation_email 
  
  # validates :email, uniqueness: true, format: { with: /\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,})+\z/i, message: ":Please enter a valid email address."}

  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 6..20 }

  def full_name
   full_name =  self.first_name + ' ' + self.last_name
  end

  def confirm 
    self.confirmed_at.present?
    
  end



  private 

  def generate_confirmation_token
    self.confirmation_token = SecureRandom.hex(10)
    self.confirmation_sent_at = Time.now
  end

  def send_confirmation_email
    SendConfirmationInstructionJob.perform_now(self)
    
  end

end
