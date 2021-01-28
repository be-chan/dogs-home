Rails.application.routes.draw do
  devise_for :users
  root to: 'dogs#index'
  resources :dogs do
    resources :inquiry_records
  end
  resources :users
end
