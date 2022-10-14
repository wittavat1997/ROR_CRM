Rails.application.routes.draw do
  devise_for :users , controllers: { 
    confirmations: 'users/confirmations' ,
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

    
  resources :users, only: [:index, :show, :destroy, :edit, :update] do # working missed with devise scope
      member do
        patch :ban
    end
  end
  
  # devise_scope :user do # working missed with resources :users
  #   get "/users/sign_out" => "devise/sessions#destroy"
  # end
  
  
  
  
  


  
 
  root "static_pages#landing_page"
  get "ptivacy_policy", to: 'static_pages#privacy_policy'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  #root "articles#index"
end
