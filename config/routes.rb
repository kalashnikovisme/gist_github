Rails.application.routes.draw do
  root to: 'web/welcome#index'

  scope module: :web do
    resources :users, only: [ :new, :create ]
    namespace :admin do
      resources :users, except: :show
      resources :snippets, except: :show
      resources :comments, except: :show
    end
  end
end
