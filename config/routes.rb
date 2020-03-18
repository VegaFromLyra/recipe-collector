Rails.application.routes.draw do
  root "recipes#index"

  namespace :api do
    namespace :v1 do
      resources :recipes, only: [:create, :index, :destroy]
    end
  end
end
