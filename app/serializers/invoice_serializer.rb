class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :invoice_number, :order_items, :total_amount, :vat, :sub_total_amount, :created_at
  has_one :order_detail
  has_many :order_items
end
