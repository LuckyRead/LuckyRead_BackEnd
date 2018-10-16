class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :lastname, :username, :email, :password_digest, :city_id
end