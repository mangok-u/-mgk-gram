class Api::V1::FollowsController < ApiController

  def create
    @follwe=Follow.new(follow_params)
    following=User.find(follow_params[:following_id])
    follower=User.find(follow_params[:follower_id])
    if @follwe.save
      # increment便利すぎ！！！！！！
      following.increment!(:following, 1)
      follower.increment!(:follower, 1)

      render json: @follwe, staus: :created
    else
      render json: { errors: @follwe.errors.full_messages }, status: :unprocessable_entity
    end
    
  end

  private

  def follow_params
    params.require(:follow).permit(:following_id,:follower_id)
  end

end