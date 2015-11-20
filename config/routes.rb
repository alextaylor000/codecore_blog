Rails.application.routes.draw do
  root 'posts#index'
  get '/about' => 'home#about'

  resources :users, only: [:new, :create, :show]

  get        "/signup"  => "users#new"
  get        "/login"   => "sessions#new"
  post       "/login"   => "sessions#create"
  delete     "/logout"  => "sessions#destroy"

  resources :posts do
    resources :comments, only: [:create]
    resources :favourites, only: [:create, :destroy]
  end

  resources :comments, except: [:show, :index]


end
