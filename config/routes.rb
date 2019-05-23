Rails.application.routes.draw do
  get 'themes/index'
  get 'themes/new'
  root 'times#index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources 'users'
  resources 'codes'
  resources 'times'
end
