Rails.application.routes.draw do
  resources :tasks
  devise_for :users
  root 'static_pages#welcome'
end
