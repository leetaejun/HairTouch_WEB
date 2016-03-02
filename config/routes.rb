Rails.application.routes.draw do
  resources :procedures
  resources :designers

  namespace :api do
  	resources :common_codes, only: :index

  	resources :designers, only: :index do
      collection do
        post :modify
        post :authentication
        post :signup
        post :signin
      end
    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
