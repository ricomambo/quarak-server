class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :authentication_token
end
