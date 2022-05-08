Rails.application.routes.draw do
  resources :users, except: %i[destroy edit update]
end
