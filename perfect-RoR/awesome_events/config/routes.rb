Rails.application.routes.draw do
  root 'welcome#index'
  get 'auth/:provider/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  # リソースの親子関係
  resources :events do
    resources :tickets
  end
  resource :retirements

  # 全てのURLをキャッチする(存在しないURLへのリクエストをキャッチ)
  match "*path" => "application#error404", via: :all
end
