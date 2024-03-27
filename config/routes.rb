Rails.application.routes.draw do
  get '/admin_dashboard', to: 'admin_dashboard#index', as: 'admin_dashboard'
  devise_for :admins
  devise_for :users
  root "pages#index"
  get "/about", to: "pages#about"
end
