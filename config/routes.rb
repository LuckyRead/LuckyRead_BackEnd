Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  resources :rel_fragment_sub_topics
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
