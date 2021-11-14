Rails.application.routes.draw do
  devise_for :users
  resources :libraries
  get 'home/about'
  root 'libraries#index'
  
end
