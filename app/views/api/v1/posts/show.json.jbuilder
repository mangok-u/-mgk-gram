json.extract! @post, :id, :name, :text, :created_at
json.image rails_blob_url(@post.mgk_image) if @post.mgk_image.attached?