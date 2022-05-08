Rails.application.routes.draw do
  resources :bank_account_money_transfers, except: %i[destroy edit update]
end
