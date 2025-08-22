class AgentSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :discout, :referral_code, :commission, :role, :status
end
