Rails.application.routes.draw do
  devise_for :ccs
  devise_for :users
  root to: 'home#index'
  post 'home/logout', to: "home#logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
