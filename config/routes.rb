Rails.application.routes.draw do
  

  resources :posts
  
  get 'about' => 'home#about'
  get 'contact' => 'home#contact'
  
  root 'welcome#index'


end
