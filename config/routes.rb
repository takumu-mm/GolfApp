Rails.application.routes.draw do
  namespace :public do
    get 'contacts/new'
    get 'contacts/confirm'
    get 'contacts/done'
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root "static_pages#top"
  resources :categories, param: :name, only: [:show]
  resource :profile, only: [:show, :edit, :update] do
    get 'diagnosis', on: :collection, as: 'diagnosis'
  end
  namespace :public do
    resources :contacts, only: [:new, :create] do
      collection do
        post 'confirm'
        get 'confirmation'
        post 'back'
        get 'back', to: 'contacts#back'
        get 'done'
      end
    end
  end

  get 'terms', to: 'static_pages#terms'
  get 'privacy', to: 'static_pages#privacy'
end
