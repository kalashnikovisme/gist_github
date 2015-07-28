Rails.application.routes.draw do
  scope module: :web do
    namespace :admin do
      resources :users, except: :show
    end
  end
end
