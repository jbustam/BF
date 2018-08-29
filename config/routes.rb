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

  get :enviar_email, to: 'proveedors#enviar_email', as: :enviar_email
  get    '/cotizar',   to: 'proveedors#cotizar'
  get :destroy_material, to: 'solicituds#destroy_material', as: :destroy_material
  get :destroy_material_bodega, to: 'bodegas#destroy_material', as: :destroy_material_bodega
  get :destroy_material_proveedor, to: 'proveedors#destroy_material', as: :destroy_material_proveedor

  get :editar_material_bodega, to: 'bodegas#editar_material'
  post :editar_material_bodega, to: 'bodegas#actualizar_material'

  get :editar_material_solicitud, to: 'solicituds#editar_material'
  post :editar_material_solicitud, to: 'solicituds#actualizar_material'

end
