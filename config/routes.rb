Rails.application.routes.draw do
  root to: 'events#index'

  devise_for :users

  resources :events do
    resources :attendances, only: [:new, :create]
    resources :eventimages, only: [:create]
  end

  resources :users, only: [:show] do
    resources :avatar, only: [:create]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
