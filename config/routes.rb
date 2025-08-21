Rails.application.routes.draw do
  root "reviews#index"

  resources :reviews do
    resources :comments, only: [:create, :destroy]
  end
end

