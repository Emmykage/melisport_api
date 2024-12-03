class BillingAddressSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone_no, :street, :city, :postal_code, :state
end
