Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#homepage'


  get '/users/new', to: 'users#new' 
  post '/users', to: 'users#create'
 
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  get '/users/:id', to: 'users#show'
  post '/users/:id', to: 'rides#ride'
 
  get '/attractions', to: 'attractions#index'

  get '/attractions/new', to: 'attractions#new'
  post '/attractions', to: 'attractions#create'

  get '/attractions/:id', to: 'attractions#show'
  get '/attractions/:id/edit', to: 'attractions#edit'
  patch '/attractions/:id', to: 'attractions#update'

  get '/logout', to: 'sessions#destroy'
end
