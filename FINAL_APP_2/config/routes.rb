Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users, controllers: { 
      sessions: 'users/sessions', 
      registrations: 'users/registrations' ,
      passwords: 'users/passwords'
    }
    resources :feeds
    resources :custom_passwords
    resources :profile
    resources :photos
    resources :albums
    resources :album_records
    resources :follow
    resources :discovers
    resources :people
    resources :likes
    namespace :admin do
      resources :manage_users
      resources :manage_photos
      resources :manage_albums
   end
   
    
    
    root to: 'feeds#index'
    put "/edit/password", to: "custom_passwords#update"

    delete "/follow", to: "follow#destroy"
    post "/follow", to: "follow#create"

    post "/like", to: "likes#create"
    delete "unlike", to: "likes#destroy"

    post "/avatar/change", to: "profile#change_avatar"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
