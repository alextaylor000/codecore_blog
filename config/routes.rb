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
    resources :taggings, only: [:create, :destroy]
  end

  resources :tags, only: [:index, :show]
  resources :comments, except: [:show, :index]


end
