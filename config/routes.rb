Rails.application.routes.draw do
  resources :cocktails, only: %i[index show new create] do
    # resources :doses, only: %i[new create]
    resources :doses, only: :create
    resources :reviews, only: :create
  end

  resources :doses, only: :destroy
end
