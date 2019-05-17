Rails.application.routes.draw do
  get 'times/index'
  root 'codes#index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources 'users'
  resources 'codes'
end
