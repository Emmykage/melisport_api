class MessageSerializer < ActiveModel::Serializer
  attributes :id, :subject, :content
end
