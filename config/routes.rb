Rails.application.routes.draw do
  # mount_devise_token_auth_for 'User', at: 'auth'
  # devise_for :users, controllers: {
  #   registrations: 'users/registrations',
  #   sessions: "users/sessions",
  # }
  # devise_for :users
  root to: 'home#index'
  # :<snip>

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :posts, only: [:index, :show, :create, :update,:destroy]
      resources :users do
        collection do
          get "chech_login"
        end
      end
      # mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      #   registrations: 'api/v1/auth/registrations'
      #  }

    end
  end
end
