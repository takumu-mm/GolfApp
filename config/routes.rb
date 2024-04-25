Rails.application.routes.draw do
  root "static_pages#top"
  resources :categories, param: :name, only: [:show]
end
