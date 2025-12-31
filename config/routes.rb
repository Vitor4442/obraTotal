Rails.application.routes.draw do
  devise_for :users
  resources :obras
  root "obras#index"
end
