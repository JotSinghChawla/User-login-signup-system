Rails.application.routes.draw do
  get 'profile/edit_profile'
  get 'password/forget_password'
  get 'password/reset_password'
  get 'account/login'
  get 'account/signup'
  get 'home/index'
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
