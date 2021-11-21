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

  resources :torrents
  resources :web_scrapers

end
