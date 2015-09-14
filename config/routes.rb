Rails.application.routes.draw do

  root 'sessions#index'

  post 'users' => 'users#create'
  post 'sessions' => 'sessions#create'
  get 'users/:id' => 'users#show'
  get 'sessions' => 'sessions#index'
  
  post 'playlists' => 'playlists#create'
  get 'playlists/:id' => 'playlists#show'
  post 'playlists/:id' => 'playlists#update'
  get 'likes/:id' => 'likes#show'
  delete 'sessions' => 'sessions#destroy'
end
