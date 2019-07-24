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
    
    root to: 'feeds#index'
    put "/edit/password", to: "custom_passwords#update"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
