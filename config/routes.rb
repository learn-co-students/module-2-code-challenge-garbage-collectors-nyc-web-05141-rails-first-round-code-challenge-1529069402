Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  resources :heroines, only: [:index, :show, :new, :create, :destroy]

get '/search', to: "heroines#search"
get '/', to: 'heroines#index'
end
