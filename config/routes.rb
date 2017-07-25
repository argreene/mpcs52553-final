Rails.application.routes.draw do

  root 'providers#index'
  get '/help' => 'user_stories#index'

  # Sessions

  get '/sessions/new' => 'sessions#new', as: 'new_session'
  post '/sessions' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :providers
  resources :clients
  resources :spss
  resources :results

 end

#   # Providers
#   get '/providers' => 'providers#index'
#
#   get '/providers/new' => 'providers#new', as: 'new_provider'
#   post '/providers' => 'providers#create'
#
#   get '/providers/:id' => 'providers#show', as: 'provider'
#
#   get '/providers/:id/edit' => 'providers#edit', as: 'edit_provider'
#   patch '/providers/:id' => 'providers#update'
#
#   delete '/providers/:id' => 'providers#destroy'
#
#   #SRS
#
#   get 'spss/new' => 'spss#new', as: 'new_srs'
#   post 'spss' => 'spss#create'
#
# end
#
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
