Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  root to: 'dogs#index'
  resources :dogs do
    resources :inquiry_records
  end
  resources :users
end
