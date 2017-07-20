Rails.application.routes.draw do
  resources :package_system_dependencies
  resources :system_dependencies
  resources :packages
  resources :os
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
