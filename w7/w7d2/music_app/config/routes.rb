Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resource :session, only: [:new, :create, :destroy]
   resources :users, only: [:new, :create, :show]
   root to: 'session#new'
end
