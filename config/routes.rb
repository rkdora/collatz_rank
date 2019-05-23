Rails.application.routes.draw do
  root 'times#index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources 'themes', shallow: true do
    resources 'codes'
  end
  resources 'users'
  resources 'times'
end
