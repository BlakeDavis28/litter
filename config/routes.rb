Rails.application.routes.draw do
  root 'lits#index'

  devise_for :users

  resources :lits do
    member do
        put "like", to: "lits#like"
        put "dislike", to: "lits#dislike"
      end
  end

  resources :users do
    get 'profile'
  end
end
