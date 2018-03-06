Rails.application.routes.draw do
  # Home controller routes.
  root   'home#index'
  get    'auth'            => 'homes#auth'
  
  # Get login token from Knock
  post   'user_token'      => 'user_token#create'
  
  # User actions
  get    '/users'          => 'users#index'
  get    '/users/current'  => 'users#current'
  post   '/users/create'   => 'users#create'
  patch  '/user/:id'       => 'users#update'
  delete '/user/:id'       => 'users#destroy'

  # Invitation actions
  get    '/invitations'          => 'invitations#index'
  post   '/invitations/create'   => 'invitations#create'
  patch  '/invitation/:id'       => 'invitations#update'
  delete '/invitation/:id'       => 'invitations#destroy'

end
