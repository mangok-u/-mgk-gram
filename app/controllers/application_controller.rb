class ApplicationController < ActionController::Base
        include DeviseTokenAuth::Concerns::SetUserByToken
  
  before_action :authenticate_user! 
  # before_action :configure_permitted_paramaters, if: :devise_controller? 
  protect_from_forgery  
  skip_before_action :verify_authenticity_token, if: :devise_controller? # APIではCSRFチェックをしない


  private

  # def configure_permitted_paramaters ## 追加
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :username])
  # end
end

