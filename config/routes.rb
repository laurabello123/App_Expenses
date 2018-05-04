Rails.application.routes.draw do

  resources :dashboard, only:[:index]
  resources :expenses, only:[:index]

  root 'dashboard#index'

  devise_for :users

end
