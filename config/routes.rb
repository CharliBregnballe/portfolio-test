Rails.application.routes.draw do
  resources :portfolis, except: [:show]
  get 'angular-items', to: 'portfolis#angular'
  get 'portfoli/:id', to: 'portfolis#show', as: 'portfoli_show'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
end
