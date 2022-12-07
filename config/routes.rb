Rails.application.routes.draw do
  devise_for :users

  resources :pages, only: %i[edit] do
    resources :elements, except: %i[index] do
      member do
        patch :move
      end
    end
  end

  resources :profiles, only: %i[edit update]
  resources :themes, only: %i[edit update]

  post 'flash', to: 'flash#dismiss'
  get ':id', to: 'users#show', as: 'username'

  root 'static_pages#home'
end
