Rails.application.routes.draw do
  root to: 'web/welcome#index'

  scope module: :web do
    namespace :admin do
      resources :users, except: :show
    end
  end
end
