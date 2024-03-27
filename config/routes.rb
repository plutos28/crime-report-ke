Rails.application.routes.draw do
  get 'admin_dashboard/index'
  devise_for :admins
  devise_for :users
  root "pages#index"
  get "/about", to: "pages#about"
end
