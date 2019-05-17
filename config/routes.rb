Rails.application.routes.draw do
  

  devise_for :users
  resources :posts 

  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  
  get 'about' => 'home#about'
  get 'contact' => 'home#contact'
  
  root 'home#index'


end
