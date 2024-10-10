class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :phone_no, :role, :full_name, :confirmed, :confirmed_at

  def full_name
    "#{object.first_name} #{object.last_name}"
   end


end
