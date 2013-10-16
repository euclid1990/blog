Blog::Application.routes.draw do
  root  'static_pages#home'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:new, :create, :destroy, :show]
  resources :micropost do
    resources :comments
  end
  match '/comments/delete',  to: 'comments#delete',            via: 'post'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
end
