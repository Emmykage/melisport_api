class DeliverySerializer < ActiveModel::Serializer
  attributes :id, :state, :delivery_fee
end
