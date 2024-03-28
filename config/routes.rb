Rails.application.routes.draw do
  get '/admin_dashboard', to: 'admin_dashboard#index', as: 'admin_dashboard'
  get '/admin_dashboard/data', to: 'admin_dashboard#data_dashboard', as: 'admin_data'
  devise_for :admins
  devise_for :users
  root "pages#index"
  get "/about", to: "pages#about"

  get '/crime_counts', to: 'reports#crime_counts_by_type', as: 'crime_counts'

  resources :reports do
    get 'map_data', on: :collection
  end

  resources :admin_reports, only: [] do 
    collection do
      get 'generate_csv'
      get 'generate_pdf'
    end
  end
end
