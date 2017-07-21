# frozen_string_literal: true

Rails.application.routes.draw do
  resources :operating_systems
  resources :package_system_dependencies
  resources :package_dependencies
  resources :system_dependencies
  resources :packages

  post 'api/lookups/package_system_dependencies', to: 'package_system_dependencies#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
