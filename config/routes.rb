Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  resources :projects
  resources :subprojects, only: [:new, :create]
  resources :admin, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
end
