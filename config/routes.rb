Rails.application.routes.draw do
	resources :password_resets,     only: [:new, :create, :edit, :update]
  
  get 'password_resets/new'
  get 'password_resets/edit'

  get    '/login' => 'sessions#new'
  post   '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

	resources :users
  get 'signup' => 'users#new'
  post '/signup' => 'users#create'

  root 'static_pages#home'
  get 'static_pages/home' 
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  resources :account_activations, only: [:edit]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
