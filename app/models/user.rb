class User < ApplicationRecord
  has_secure_password
  attr_accessor :skip_email_validation, :skip_password_validation

  has_many :shopping_carts, dependent: :destroy
  has_many :cart_items, through: :shopping_carts
  has_many :user_payments
  has_many :addresses
  has_many :order_details

 before_create :downcase_email


  before_create :generate_confirmation_token
  after_create :send_confirmation_email

  # validates :email, uniqueness: true, format: { with: /\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,})+\z/i, message: ":Please enter a valid email address."}
  validates :email, presence: true, uniqueness: {case_sensitive: false}, unless: -> { skip_email_validation? }
  validates :first_name, :last_name, presence: true
  validates :password, length: { in: 6..20 }, unless: -> { skip_password_validation? }


  # attr_accessor :skip_email_validation, :skip_password_validation
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
  def skip_email_validation?
    skip_email_validation
  end

  def downcase_email
    self.email = email.downcase if email.present?

  end


  def skip_password_validation?
    skip_password_validation
  end
end
