Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # get 'pages/index'
  root "pages#index"

  get "/about", to: "pages#about"

  resources :reports
end
