Rails.application.routes.draw do
  resource :users, only: [:create, :new]
  resource :sessions, only: [:new, :create, :destroy]
end
