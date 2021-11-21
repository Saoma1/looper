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

  # resources :user do
  #   collection do
  #     delete :destroy_all_movies
  #   end
  # end

  # resources :movies do
  # end

  # resource :movies, only: :destroy, action: :destroy_all

  resources :torrents
  resources :web_scrapers

end
