Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  resources :projects, only: [:new, :create]
  resources :subprojects, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
