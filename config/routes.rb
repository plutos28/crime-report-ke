Rails.application.routes.draw do
  get 'status_changer/update_status'
  get '/admin_dashboard', to: 'admin_dashboard#index', as: 'admin_dashboard'
  get '/admin_dashboard/data', to: 'admin_dashboard#data_dashboard', as: 'admin_data'
  devise_for :admins
  devise_for :users
  root "pages#index"
  get "/about", to: "pages#about"

  get '/crime_counts', to: 'reports#crime_counts_by_type', as: 'crime_counts'

  resources :reports do
    get 'map_data', on: :collection
    get 'crime_counts_by_date', on: :collection
  end
  
  post 'status_changer/:id/update_status', to: 'status_changer#update_status'

  resources :admin_reports, only: [] do 
    collection do
      get 'generate_csv'
      get 'generate_pdf'
    end
  end
end
