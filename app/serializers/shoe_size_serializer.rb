class ShoeSizeSerializer < ActiveModel::Serializer
  attributes :id, :size, :quantity
  belongs_to :product
end
