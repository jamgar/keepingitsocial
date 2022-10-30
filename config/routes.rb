Rails.application.routes.draw do
  devise_for :users

  resources :pages, only: %i[show edit] do
    resources :elements, except: %i[index] do
      member do
        patch :move
      end
    end
  end

  get ':id', to: 'users#show'

  root 'static_pages#home'
end
