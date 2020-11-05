Rails.application.routes.draw do
  resources :cocktails, only: %i[index show new create] do
    # resources :doses, only: %i[new create]
    resources :doses, only: %i[create]
  end

  resources :doses, only: :destroy
end
