Rails.application.routes.draw do
  resources :posts
  resources :users

  resources :candidates  do 
  	member do 
  		post :vote 
  	end 
  end 
  #root "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
