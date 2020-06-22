Rails.application.routes.draw do

  root 'lits#index'

  devise_for :users

  resources :lits
  resources :users do

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
