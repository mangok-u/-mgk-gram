class Api::V1::UsersController < ApiController


def chech_login
 
  if  user_signed_in?
    @user=current_user

    render json: @user and return
  else
    @user={}
    render json: @user
  end
  
end

def create
  binding.pry
  user = User.new(user_params)
  if user.save
    render json: user, status: :created
  else
    render json: user.errors, status: :unprocessable_entity
  end
end

private
  def user_params
    params.require(:user).permit(:password,:email, :uid, :full_name,:user_name)
  end




end
