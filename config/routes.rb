Rails.application.routes.draw do

  resources :photos

  devise_for :users

 

  authenticated :user do
    root "photos#index", as: "authenticated_root"
  end

   devise_scope :user do
    root to: "devise/sessions#new"
  end
  


  
end


