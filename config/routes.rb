Rails.application.routes.draw do
  resources :messages
  resources :conversations
  post 'user_token' => 'user_token#create'
  resources :users
  resources :git_collaborations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :conversations, only: [:index, :create]   
  resources :messages, only: [:create]   
  mount ActionCable.server => '/cable'
end
