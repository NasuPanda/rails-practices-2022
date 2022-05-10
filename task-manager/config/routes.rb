Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  root 'static_pages#welcome'
end
