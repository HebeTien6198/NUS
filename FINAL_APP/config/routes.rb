Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
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
  get 'info/:id', to: "feed#info", as: 'info'
  #login-out#
  get 'register', to: "register#register"
  get 'login', to: "login#login"
 
  #profile#
  get 'profile', to: "profile#profile"
  get 'editPhoto/:id', to: "profile#editPhoto", as: 'editPhoto'
  get 'editAlbum/:id', to: "profile#editAlbum", as: 'editAlbum'
  get 'newPhoto', to: "profile#newPhoto"
  get 'newAlbum', to: "profile#newAlbum"
  

  #-----------------------ADMIN---------------------------#
  #---Get----#
  get 'admin', to: "admin#admin"
  get 'admin/edit/:id', to: "admin#edit", as: 'admin/edit'
  get 'admin/managePhoto', to: "admin#managePhoto"
  get 'admin/manageAlbum', to: "admin#manageAlbum"
  get 'admin/editPhoto/:id', to: "admin#editPhoto", as: "admin/editPhoto"
  get 'admin/editAlbum/:id', to: "admin#editAlbum", as: "admin/editAlbum"
  #---Post----#
  post 'updateProfile', to: "admin#updateProfile"
  post 'admin/updateAvatar', to: "admin#updateAvatar"
  post 'admin/updatePhoto', to: "admin#updatePhoto"
  post 'admin/updateAlbum', to: "admin#updateAlbum"
  #----Delete---#
  post 'admin/deletePhoto/:id', to: "admin#deletePhoto", as: "admin/deletePhoto"
  post 'admin/deleteAlbum/:id', to: "admin#deleteAlbum", as: "admin/deleteAlbum"
  post 'admin/removePhoto/:id', to: "admin#removePhotoFromAlbum", as: "admin/removePhoto"
  post 'admin/deleteUser/:id', to: "admin#deleteUser", as: "admin/deleteUser"

  
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
  post 'editPhotoServer', to: "profile#editPhotoServer"
  post 'editAlbumServer', to: "profile#editAlbumServer"
  post 'uploadPhoto', to: "profile#uploadPhoto"
  post 'uploadAlbum', to: "profile#uploadAlbum"
  #-------Delete-------#
  post 'deletePhoto/:id', to: "profile#deletePhoto", as: 'deletePhoto'
  post 'deleteAlbum/:id', to: "profile#deleteAlbum", as: 'deleteAlbum'
  post 'removePhoto/:id', to: "profile#removePhoto", as: 'removePhoto'
  #-----------Search--------------------#
  post 'discover', to: "feed#discover"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end


  
  
end
