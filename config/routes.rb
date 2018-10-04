Rails.application.routes.draw do
  resources :preferences
  resources :rel_topic_sub_topics
  resources :sub_topics
  resources :topics
  resources :reactions
  resources :photos
  resources :responses
  resources :comments
  resources :fragments
  resources :friends
  resources :users
  resources :countries
  resources :cities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
