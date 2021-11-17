Rails.application.routes.draw do
  root 'home#index'
  
  get 'profile/edit_profile'
  
  get 'password/forget_password'
  get 'password/reset_password'

  get 'account/login'
  get 'account/signup'
  post 'account/signup'
  post 'account/login'

  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
