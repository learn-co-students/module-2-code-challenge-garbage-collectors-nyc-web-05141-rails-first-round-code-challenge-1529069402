Rails.application.routes.draw do
  resources :powers#, only: [:index]
  resources :heroines#, only: [:index]
end

#way more routes than is neccessary. Would add "onlys" if had more time
