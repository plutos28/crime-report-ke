Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root "pages#index"
  get "/about", to: "pages#about"
end
