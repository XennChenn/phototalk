Rails.application.routes.draw do

  authenticated :user do
    root "photos#index", as: "authenticated_root"
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :photos do
    member do
      get "like", to: "photos#upvote"
      get "unlike", to: "photos#downvote"
    end
  end

  devise_for :users

  resources :users, only: [:show]

  

   
  
end


