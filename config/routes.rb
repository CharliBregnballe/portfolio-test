Rails.application.routes.draw do
  resources :portfolis, except: [:show]
  get 'portfoli/:id', to: 'portfolis#show', as: 'portfoli_show'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs

  root to: 'pages#home'
end
