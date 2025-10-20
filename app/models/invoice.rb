class Invoice < ApplicationRecord
  belongs_to :order_detail
  has_many :order_items, through: :order_detail
  before_create :generate_invoice_number


  def sub_total_amount
    order_items.sum(:amount)
  end

  def vat
    sub_total_amount * 0.05
  end

  def total_amount
    sub_total_amount + vat
  end


  private

  def generate_invoice_number
    last_number = Invoice.order(:created_at).last&.invoice_number&.gsub(/\D/, '').to_i
    self.invoice_number = "INV#{(last_number + 1).to_s.rjust(6, '0')}"
  end
end
