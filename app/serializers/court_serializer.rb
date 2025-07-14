class CourtSerializer < ActiveModel::Serializer
  attributes :id, :address, :state, :city
end
