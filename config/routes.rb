Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users
  resources :events do
    resources :attendances
  end

  post "/events/:event_id/attendances", to: "attendances#create", as: "event_sub"

  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
