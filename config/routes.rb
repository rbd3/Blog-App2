Rails.application.routes.draw do
  devise_for :users


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end

  resources :posts do
    resources :comments, only: %i[new create]
    resource :likes, only: [:create]
  end
end
 