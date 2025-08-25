class AgentSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :discount, :referral_code, :commission, :role, :active
end
