Rails.application.routes.draw do

  devise_for :users

  root to: "home#top"
  
  resources :books
  resources :users, only: [:index, :show, :edit, :update]

  get 'home/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
