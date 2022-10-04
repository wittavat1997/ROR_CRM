Rails.application.routes.draw do
  devise_for :users , controllers: { confirmations: 'confirmations' }
  #config/routes.rb
  resources :users do
   resources :users, only: [:index,:show]
  end
  
  # devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'  
  # end
 
  
  root "static_pages#landing_page"
 # get 'static_pages/landing_page'
 # get 'static_pages/privacy_policy'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #root "articles#index"
end
