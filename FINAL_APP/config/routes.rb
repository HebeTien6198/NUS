Rails.application.routes.draw do
  
  get 'profile/profile'
  get 'profile/editProfile'
  #------------------------GET-----------------------------
  get 'feed/feed'
  get 'register/register'
  get 'login/login'

  #---For shoter Get----
  #feed#
  get 'feed', to: "feed#feed"
  get 'discover', to: "feed#discover"
  get 'info', to: "feed#info"
  #login-out#
  get 'register', to: "register#register"
  get 'login', to: "login#login"
 
  #profile#
  get 'profile', to: "profile#profile"
  get 'editPhoto/:id', to: "profile#editPhoto", as: 'editPhoto'
  get 'editAlbum/:id', to: "profile#editAlbum", as: 'editAlbum'
  get 'newPhoto', to: "profile#newPhoto"
  get 'newAlbum', to: "profile#newAlbum"
  
  #avatar#

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
  
  #---Avatar----#
  post 'updateAvatarFromPhoto', to: "profile#updateAvatarFromPhoto"
  #-----------Follow-Unfollow---------#
  post 'follow', to: "feed#follow"
  post 'unfollow', to: "feed#unfollow"
  #-----------Like-Unlike------------#
  post 'like', to: "feed#like"
  post 'unlike', to: "feed#unlike"
  #---------------Comment------------#
  post 'comment', to: "feed#CreatePhotoComments"
  #--------------Edit------------
  post 'editBasicProfile', to: "profile#editBasicProfile"
  post 'editPassword', to: "profile#editPassword"
  post 'updateProfile', to: "admin#updateProfile"
  post 'editPhotoServer', to: "profile#editPhotoServer"
  post 'uploadPhoto', to: "profile#uploadPhoto"
  post 'uploadAlbum', to: "profile#uploadAlbum"
  #-------Delete-------#
  post 'deletePhoto/:id', to: "profile#deletePhoto", as: 'deletePhoto'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
