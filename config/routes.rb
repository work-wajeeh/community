Rails.application.routes.draw do
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
  root "groups#index" 
end

