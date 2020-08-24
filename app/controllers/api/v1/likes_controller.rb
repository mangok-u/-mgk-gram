class Api::V1::LikesController < ApiController

  def create
    @like=Like.new(like_params)
    like_post=Post.find(like_params[:posts_id])
    # follower=User.find(follow_params[:follower_id])
    if @like.save
      # increment便利すぎ！！！！！！
      like_post.increment!(:like, 1)
     

      render json: @like, staus: :created
    else
      render json: { errors: @like.errors.full_messages }, status: :unprocessable_entity
    end
    
  end

  # def destroy
  #   follow_info=Follow.where(following_id: params[:id])
  #   @follow=follow_info.find_by(follower_id:follow_params[:follower_id])
  #   following=User.find(follow_params[:following_id])
  #   follower=User.find(follow_params[:follower_id])
  #   if @follow.destroy
  #     # increment便利すぎ！！！！！！
  #     following.decrement!(:following, 1)
  #     follower.decrement!(:follower, 1)

  #     render json: @follwe, staus: :created
  #   else
  #     render json: { errors: @follwe.errors.full_messages }, status: :unprocessable_entity
  #   end
    
  # end


  private

  def like_params
    params.require(:like).permit(:posts_id,:users_id)
  end

end