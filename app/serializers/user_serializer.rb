class UserSerializer < ActiveModel::Serializer
  # include Concerns::ImageUrl
  include Rails.application.routes.url_helpers
  # included do
  #   Rails.application.routes.default_url_options[:host] = 'your_host'
  # end

  attributes :id,:full_name,:user_name,:uid,:image,:following,:follower
  # has_many :posts, serializer: PostSerializer
  has_many :posts do
    object.posts.with_attached_mgk_image.order(id: "desc")
  end

  has_many :following_info
  has_many :follower_info



  def image
    url_for(object.icon) if object.icon.attached?
   end

end
