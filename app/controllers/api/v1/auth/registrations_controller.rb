module Auth
class Api::V1::Auth::RegistrationsController <DeviseTokenAuth::RegistrationsController

  skip_before_action :authenticate_user!
  private
  def sign_up_params
    params.permit(:email,:fullname, :username,:password)
  end
  def account_update_params
    params.permit(:email,:fullname, :username)
  end


end
end

