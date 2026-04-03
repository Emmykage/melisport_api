class Agent < ApplicationRecord
  has_many :order_details, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :referral_code, presence: true, uniqueness: true
  validates :commission, numericality: { greater_than_or_equal_to: 0 }
  validates :role, inclusion: { in: %w[coach trainner promoter] }
  # validates :active, inclusion: { in: [true, false] }
  default_scope { order(created_at: :desc) }

  before_save :default_discount
  def default_discount
    self.discount ||= 0.0
  end
end
