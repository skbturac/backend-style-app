Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :locations
  resources :stylists
  resources :customers
  resources :services
  resources :menus

end