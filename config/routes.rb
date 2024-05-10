Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root "static_pages#top"
  resources :categories, param: :name, only: [:show]
  resource :profile, only: [:show, :edit, :update] do
    get 'diagnosis', on: :collection, as: 'diagnosis'
  end
end
