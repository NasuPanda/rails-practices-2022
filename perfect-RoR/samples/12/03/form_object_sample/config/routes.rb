Rails.application.routes.draw do
  resources :user_registrations, only: %i[create new] do
    collection do
      get :completed
    end
  end

  get "terms", to: "pages#terms"
end
