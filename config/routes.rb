require 'sidekiq/web'
Rails.application.routes.draw do
  get 'posts/create'
  devise_for :users
  
  
  root 'home#index'
  resources :posts, only: [:create]

  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web, at: '/sidekiq'
  end
end
