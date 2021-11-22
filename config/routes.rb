Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home', as: "home"
  get '/search', to: 'pages#search', as: :search

  resources :users do
    resources :movies do
      collection do
        delete :destroy_all
      end
    end
  end

  resources :movie_torrents
  resources :torrents
  resources :web_scrapers

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

end
