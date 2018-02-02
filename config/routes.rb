Rails.application.routes.draw do

  root 'pages#index'
  get '/edit', to: 'pages#edit'
  get 'information/edit', to: 'information#edit'

  resources :information, only: [:index, :update]
  resources :albums do 
    resources :photos, except: [:index, :show]
  end
  resources :messages, only: [:index, :create, :destroy]

end
