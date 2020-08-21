class UserSerializer < ActiveModel::Serializer
  # include Concerns::ImageUrl
  include Rails.application.routes.url_helpers
  # included do
  #   Rails.application.routes.default_url_options[:host] = 'your_host'
  # end

  attributes :id,:full_name,:user_name,:uid
  # has_many :posts, serializer: PostSerializer
  has_many :posts do
    object.posts.with_attached_mgk_image
  end


# def posts
#   object.posts.with_attached_mgk_image.order(id: "desc")
# end

end
