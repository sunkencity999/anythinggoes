Rails.application.routes.draw do
  

  devise_for :users
  resources :posts
  
  get 'about' => 'home#about'
  get 'contact' => 'home#contact'
  
  root 'home#index'


end
