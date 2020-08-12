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




end
