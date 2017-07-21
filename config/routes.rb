# frozen_string_literal: true

Rails.application.routes.draw do
  resources :operating_systems
  resources :package_system_dependencies
  resources :system_dependencies
  resources :packages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
