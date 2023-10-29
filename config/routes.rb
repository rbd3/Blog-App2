Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  ressources :users, only: [:index, :show] do 
    ressources :posts, only: [:index, :show, :new, :create]
  end

  ressources :posts do
    ressources :comments, only: [:new, :create]
    ressources :likes, only: [:create]
  end
end
