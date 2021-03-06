Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  root to: "dashboard#index"

  resources :documents

  get "login", to: "login#index"
  post "login", to: "login#login"
end
