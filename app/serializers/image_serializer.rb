class ImageSerializer < ActiveModel::Serializer
  attributes :id, :url
  has_one :product
end
