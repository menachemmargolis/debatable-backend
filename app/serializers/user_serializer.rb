class UserSerializer < ActiveModel::Serializer
  attributes :id,  :username,  :posts, :profile_photo, :email
  
  has_many :posts
end
  
