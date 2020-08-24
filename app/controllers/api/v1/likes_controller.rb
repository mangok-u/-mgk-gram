class Api::V1::LikesController < ApiController

  def create
   
    like_post=Post.find(like_params[:post_id])
    @like=Like.new(like_params)
    if @like.save
      like_post.increment!(:like_number, 1)
     
     @likes=like_post.likes
     render json: @likes, each_serializer: LikeSerializer
      # render json: @like, staus: :created
    else
      render json: { errors: @like.errors.full_messages }, status: :unprocessable_entity
    end
    
  end

  def destroy
    like_info=Like.where(post_id: like_params[:post_id])
    like_post=Post.find(like_params[:post_id])
    @like=like_info.find_by(user_id: like_params[:user_id])
    if @like.destroy
      like_post.decrement!(:like_number, 1)
     
      @likes=like_post.likes
      render json: @likes, each_serializer: LikeSerializer
    else
      render json: { errors: @like.errors.full_messages }, status: :unprocessable_entity
    end
    
  end

  private

  def like_params
    params.require(:like).permit(:post_id,:user_id)
  end

end