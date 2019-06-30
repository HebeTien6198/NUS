Rails.application.routes.draw do
  #------------------------GET-----------------------------
  get 'feed/feed'
  get 'register/register'
  get 'r', to: "register#create"
  get 'login/login'

  #---For shoter Get----
  get 'register', to: "register#register"
  get 'login', to: "login#login"

  #------------------------POST------------------------------
  post 'register', to: "register#create"
  post 'login', to: "login#validateLogin"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
