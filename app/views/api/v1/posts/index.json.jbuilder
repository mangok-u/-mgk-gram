if @posts.present?
  # json.posts do 
    json.array!(@posts) do |post| 
      json.extract! post, :id, :name, :text
      json.image rails_blob_url(post.mgk_image) if post.mgk_image.attached?
    # end
  end
end
# json.array! @child_categories do |child|
#   json.id  child.id
#   json.name   child.name
# end

# json.id        @post.id
# json.title     @book.title
# json.author    @book.author
# json.publisher @book.publisher
# json.genre     @book.genre
# json.array! @posts do |post|
#   json.name post.name
#   json.id post.id
# end