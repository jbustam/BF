Rails.application.routes.draw do
  match '/users',   to: 'users#view',   via: 'get'
  get 'pages/manage_users'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  root to: "pages#index"
end
