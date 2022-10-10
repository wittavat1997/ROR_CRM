Rails.application.routes.draw do
  devise_for :users , controllers: { 
   confirmations: 'confirmations' ,
   omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :users, only: [:index, :show, :destroy] do
      member do
        patch :ban
    end
  end
  
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy' 
  end
 
  
  resources :users, only: [:index,:show,:destroy]
 
  
  root "static_pages#landing_page"
 # get 'static_pages/landing_page'
   get 'static_pages/privacy_policy'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #root "articles#index"
end
