Rails.application.routes.draw do
  root 'home#index'
  
  get 'profile/edit_profile'

  patch 'profile/edit_profile'
  
  get 'password/forget_password'
  get 'password/reset_password'
  
  post 'password/reset_password'
  post 'password/forget_password'

  get 'account/login'
  get 'account/signup'
  get 'account/logout'

  post 'account/signup'
  post 'account/login'

  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
