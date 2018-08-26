Rails.application.routes.draw do
  resources :orden_de_compras
  resources :proveedors
  resources :bodegas
  get 'sessions/new'
  resources :solicituds
  resources :usuarios
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root 'sessions#new'

  get    '/cotizar',   to: 'proveedors#cotizar'
end
