Rails.application.routes.draw do
  get 'mentions/index'
  devise_for :users
  resources :groups do
    member do
      get 'join'
    end
    resources :posts do
      resources :comments do
        member do
          post 'reply'
        end
      end
    end
  end
  resources :mentions, only: [:index]
  resources :users, only: [:show]
  root "groups#index" 
end

