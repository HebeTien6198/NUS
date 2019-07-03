Rails.application.routes.draw do
  
  get 'profile/profile'
  get 'profile/editProfile'
  #------------------------GET-----------------------------
  get 'feed/feed'
  get 'register/register'
  get 'login/login'

  #---For shoter Get----
  get 'register', to: "register#register"
  get 'login', to: "login#login"
  get 'feed', to: "feed#feed"
  get 'profile', to: "profile#profile"
  get 'editPhoto', to: "profile#editPhoto"
  get 'newPhoto', to: "profile#newPhoto"
  #--admin---
  get 'admin', to: "admin#admin"
  get 'admin/edit', to: "admin#edit"
  get 'admin/managePhoto', to: "admin#managePhoto"
  
  #------------------------POST------------------------------
  post 'register', to: "register#create"
  post 'login', to: "login#validateLogin"
  post 'feed/logOut', to: "feed#logOut"
  post 'profile/logOut', to: "profile#logOut"
  post 'logOut', to: "feed#logOut"

  #--------------Edit------------
  post 'editBasicProfile', to: "profile#editBasicProfile"
  post 'editPassword', to: "profile#editPassword"
  post 'updateProfile', to: "admin#updateProfile"
  post 'editPhotoServer', to: "profile#editPhotoServer"
  post 'uploadPhoto', to: "profile#uploadPhoto"

  #-------Delete-------#
  post 'deletePhoto', to: "profile#deletePhoto"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
