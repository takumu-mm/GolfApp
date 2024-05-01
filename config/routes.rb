Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root "static_pages#top"
  resources :categories, param: :name, only: [:show]
end
