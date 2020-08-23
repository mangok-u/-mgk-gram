class Api::V1::FollowsController < ApiController

  def create
    @follwe=Follow.new(follow_params)
    if @follwe.save
      render json: @follwe, staus: :created
    else
      render json: { errors: @follwe.errors.full_messages }, status: :unprocessable_entity
    end
    
  end

  private

  def follow_params
    params.require(:follow).permit(:following,:follower)
  end

end