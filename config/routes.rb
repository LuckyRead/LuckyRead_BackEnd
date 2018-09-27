Rails.application.routes.draw do
  resources :photos
  resources :user_fragments
  resources :responses
  resources :comments
  resources :sub_topics
  resources :topics
  resources :fragments
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
