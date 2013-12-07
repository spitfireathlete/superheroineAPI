SuperheroineAPI::Application.routes.draw do
  
  devise_for :users
  resources :users
  resources :cards
  resources :tokens, :only => [:create, :destroy]
  
   
   namespace :api do
       resources :cards
       resources :superheroines
       resources :decks
       
       put 'cards/:id/favorite', to: 'cards#favorite'
       put 'cards/:id/share', to: 'cards#share'
     end
     
    

  authenticated :user do
       root :to => 'api/cards#index.json', :as => :authenticated_root
     end
     root :to => redirect('/users/sign_in')
end
