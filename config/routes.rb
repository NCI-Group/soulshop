Rails.application.routes.draw do
  resources :inventories
  get 'site/home'
  get 'site/about'
  get 'site/contact'
  
  
  
  
  
  
  
  
  
  
  
  #The following line needs to be at the bottom of all the routes added. Add any further routes above this
  root 'site#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
