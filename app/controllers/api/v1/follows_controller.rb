class Api::V1::FollowsController < ApiController

  def create
    @follwe=Follow.new(follow_params)
    following=User.find(follow_params[:following_id])
    follower=User.find(follow_params[:follower_id])
    if @follwe.save
      following.increment!(:following, 1)
      follower.increment!(:follower, 1)
      
      @follower_info=follower.follower_info
      render json:  @follower_info, each_serializer: FollowSerializer
      # render json: @follwe, staus: :created
    else
      render json: { errors: @follwe.errors.full_messages }, status: :unprocessable_entity
    end
    
  end

  def destroy
    follow_info=Follow.where(following_id: params[:id])
    @follow=follow_info.find_by(follower_id:follow_params[:follower_id])
    following=User.find(follow_params[:following_id])
    follower=User.find(follow_params[:follower_id])
    if @follow.destroy
      # increment便利すぎ！！！！！！
      following.decrement!(:following, 1)
      follower.decrement!(:follower, 1)

      @follower_info=follower.follower_info
      render json: @follower_info, each_serializer: FollowSerializer
    else
      render json: { errors: @follwe.errors.full_messages }, status: :unprocessable_entity
    end
    
  end


  private

  def follow_params
    params.require(:follow).permit(:following_id,:follower_id)
  end

end