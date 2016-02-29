Rails.application.routes.draw do
  resources :designers

  namespace :api do
  	resources :common_codes, only: :index
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
