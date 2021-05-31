Rails.application.routes.draw do
  resources :posts do
   scope module: :posts do
    resources :likes, only: %i[create destroy]
   end
  end
  devise_for :users
  root "home#index"
end
