class ProductsSerializer < ActiveModel::Serializer
  attributes :id
  belong_to :product_category
end
