class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :phone_no, :role, :full_name, :confirmed_at

  def full_name
    "#{object.first_name} #{object.last_name}"
   end

 
end
