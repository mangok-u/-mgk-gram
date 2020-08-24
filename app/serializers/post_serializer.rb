class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  # host = 'samplehost'
  # ヘルパー使うためにこの記述をdevelopment.rb
  #deployした時は変更しような！
  #local_host3000にsる
  # Rails.application.routes.default_url_options[:host] = host
  
  attributes :id,:text,:user_id,:image,:like_number
  belongs_to :user
  has_many :likes


    def image
    url_for(object.mgk_image) if object.mgk_image.attached?
    end

end