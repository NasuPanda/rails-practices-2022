Rails.application.routes.draw do
  # リソースの親子関係
  resources :events do
    resources :tickets
  end

  resource :retirements

  root 'welcome#index'
  get 'auth/:provider/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
