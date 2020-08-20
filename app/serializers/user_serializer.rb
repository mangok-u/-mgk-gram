class UserSerializer < ActiveModel::Serializer
  attributes :id,:full_name,:user_name,:uid
  has_many :posts
end
