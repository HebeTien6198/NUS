Rails.application.routes.draw do
  get 'home/index'
  get 'home/ping'
  get 'home/pong'
  get 'cc', to: 'home#ping'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
