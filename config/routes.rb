require 'sidekiq/web'
Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'posts/create'
  devise_for :users
  
  
  root 'home#index'
  resources :posts, only: [:create,:destroy,:edit,:update]

  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web, at: '/sidekiq'
  end
end
