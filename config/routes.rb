Rails.application.routes.draw do
  get 'users/index'
  get '/' ,to: 'users#index'

  # get 'lessons/hello', to: 'lessons#hello'
  # get 'lessons/call', to: 'lessons#call'

  post 'users/new' , to: 'users#create'
  post 'users/:id/edit' , to: 'users#update'
  get 'users/:id/edit' , to: 'users#edit'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
end
