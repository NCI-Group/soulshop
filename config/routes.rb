Rails.application.routes.draw do



  resources :profiles
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  resources :inventories

# Not needed. The proper urls are assigned below and and the bottom
#  get 'home/homepage'
#  get 'site/about'
#  get 'site/contact'

  get '/about' => 'site#about'
  get '/contact' => 'site#contact'

  get '/cart' => 'cart#index'
  get '/cart/clear' => 'cart#clearCart'
  get '/cart/:id' => 'cart#add'

  get '/signedinuserprofile' => 'profiles#signedinuserprofile'
  get '/profile' => 'profiles#signedinuserprofile'








  #The following line needs to be at the bottom of all the routes added. Add any further routes above this
  root 'home#homepage'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
