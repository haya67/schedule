Rails.application.routes.draw do

  get 'users/index'
  get '/' ,to: 'users#index'

  post 'users/new' , to: 'users#create'
  post 'users/:id/edit' , to: 'users#update'
  get 'users/:id/edit' , to: 'users#edit'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
# ------------------------------------------
  get 'posts/index'
  get '/' ,to: 'posts#index'

  post 'posts/new' , to: 'posts#create'
  post 'posts/:id/edit' , to: 'posts#update'
  get 'posts/:id/edit' , to: 'posts#edit'

  resources :posts
end
