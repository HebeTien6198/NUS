Rails.application.routes.draw do
  get 'home/index'
  get 'home/ping'
  get 'home/pong', as: 'different_name'
  get "home/applepie", to: "home#ping"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
