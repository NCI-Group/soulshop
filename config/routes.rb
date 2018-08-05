Rails.application.routes.draw do
  

  devise_for :users
  resources :inventories
  get 'site/home'
  get 'site/about'
  get 'site/contact'
  
  get '/cart' => 'cart#index'
  get '/cart/clear' => 'cart#clearCart'
  get '/cart/:id' => 'cart#add'
  
  
  
  
  
  
  
  
  
  #The following line needs to be at the bottom of all the routes added. Add any further routes above this
  root 'site#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
