Rails.application.routes.draw do
 
  root to: 'home#index'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :posts, only: [:index, :show, :create, :update,:destroy]
      resources :users do
        member do
          patch "icon_update"
        end
        collection do
          get "search"
        end
      end
      resources :follows, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end


  #本番環境のエラーを止める
  # get '*path' => 'home#index'
end
