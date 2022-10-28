Rails.application.routes.draw do
  devise_for :users

  resources :pages, only: %i[show edit] do
    resources :elements, except: %i[index]
  end

  get ':id', to: 'users#show'

  root 'static_pages#home'
end
