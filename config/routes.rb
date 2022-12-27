Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "lists#index"
  resources :lists do
    resources :bookmarks, only: %i[new create]
  end
    resources :bookmarks, only: [:destroy]
    resources :lists, only: [:destroy]
  end
