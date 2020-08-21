class Api::V1::UsersController < ApiController

def show
  if params[:id] 
    @user = User.find(params[:id])
    render json: @user, serializer: UserSerializer
  else 
    @users = User.all
    render json: @users
  end

end


end