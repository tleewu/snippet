Rails.application.routes.draw do
  resource :users, only: [:create, :new]
  resource :sessions, only: [:new, :create, :destroy]

  namespace :api, defaults: {format: :json} do
    resources :articles, only: [:create]
    # resources :annotations, only: [:create]
  end

  root to: 'static_pages#index'
end
