Rails.application.routes.draw do
  

  resources :posts
  
  get 'about' => 'home#about'
  get 'contact' => 'home#contact'
  
  root 'home#index'


end
