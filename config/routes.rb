Rails.application.routes.draw do
  get 'sessions/new'
  resources :solicituds
  resources :usuarios
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root 'sessions#new'
end
