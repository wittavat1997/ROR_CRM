Rails.application.routes.draw do
  
  root "static_pages#landing_page"
    
  devise_for :users , controllers: { 
    confirmations: 'users/confirmations' ,
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  resources :users, only: [:index, :show, :destroy] do
      member do
        patch :ban
    end
  end
  

   get 'static_pages/privacy_policy'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  #root "articles#index"
end
