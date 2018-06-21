Rails.application.routes.draw do
  
  resources :searches
  resources :availabilities
  resources :post_attachments
	resources :password_resets,     only: [:new, :create, :edit, :update]
  
  get 'password_resets/new'
  get 'password_resets/edit'

  get    '/login' => 'sessions#new'
  post   '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

	resources :users
  get 'signup' => 'users#new'
  post '/signup' => 'users#create'
  get 'index' => 'users#index'

  resources :users do
    post :coach
  end
  #=> output: user_coach POST /users/:user_id/coach(.:format)  users#coac

  root 'static_pages#home'
  get 'static_pages/home' 
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  resources :account_activations, only: [:edit]

  get 'become_coach', to: 'messages#new'
  post 'become_coach', to: 'messages#create'

  resources :posts

  resources :users do
    resources :post
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
