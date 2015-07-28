Rails.application.routes.draw do
  root to: 'web/welcome#index'

  scope module: :web do
    resources :users, only: [ :new, :create ]

    scope module: :users do
      resources :snippets
    end

    namespace :admin do
      resources :users, except: :show
      resources :snippets, except: :show
      resources :comments, except: :show
    end
  end

  namespace :api do
    scope module: :users do
      resources :comments, only: [ :create, :update, :destroy ]
    end
  end
end
