Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  # get "application/L4"
  # root "application#L4"
  
  get 'top/main'
  post 'top/login'
  get 'top/signup', to: 'top#signup' ,as: 'signup'
  get 'top/logout'

  root 'top#main'
end
