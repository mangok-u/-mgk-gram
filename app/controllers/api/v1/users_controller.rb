class Api::V1::UsersController < ApiController


  def index
    if params[:uid] 
      @user = User.find_by(uid: params[:uid])
      render json: @user, serializer: UserSerializer
    else 
      @users = User.all
      render json: @users
    end
  end

  def show
    if params[:id] 
      @user = User.find(params[:id])
      render json: @user, serializer: UserSerializer
    else 
      @users = User.all
      render json: @users
    end
  end

  def icon_update
    @user=User.find(params[:id])
  
    if @user.update(user_params)
      @user.parse_base64(params[:image])
    
   
      render json: @user, staus: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end




def create
  
  user = User.new(user_params)
  if user.save
    render json: user, status: :created
  else
    render json: user.errors, status: :unprocessable_entity
  end
end

private
  def user_params
    params.require(:user).permit(:password,:email, :uid, :full_name,:user_name,:image)
  end




end
