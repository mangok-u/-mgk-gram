class UserSerializer < ActiveModel::Serializer
  # include Concerns::ImageUrl
  include Rails.application.routes.url_helpers
  # included do
  #   Rails.application.routes.default_url_options[:host] = 'your_host'
  # end

  attributes :id,:full_name,:user_name,:uid,:image
  # has_many :posts, serializer: PostSerializer
  has_many :posts do
    object.posts.with_attached_mgk_image
  end



  def image
    url_for(object.icon) if object.icon.attached?
   end

end
