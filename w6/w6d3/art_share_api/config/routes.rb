Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :ArtworkShare, only: [:create, :destroy]

  resources :users, except: [:new, :edit]
  resources :artworks, except: [:new, :edit]
end
