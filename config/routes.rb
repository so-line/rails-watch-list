# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/movies', to: 'movies#index'
  resources :lists do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: :destroy
end
