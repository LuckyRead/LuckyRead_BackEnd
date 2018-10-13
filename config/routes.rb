Rails.application.routes.draw do
  post 'login' => 'user_token#create'
  post 'signup' => 'users#signup'
  get 'users/current' => 'users#current'
  post 'myfriend' => 'friends#myfriend'
  post 'users/email_exist' => 'users#email_exist'
  post 'users/user_exist' => 'users#user_exist'
  #resources :rel_fragment_sub_topics
  #resources :preferences
  #resources :rel_topic_sub_topics
  #resources :sub_topics
  #resources :topics
  #resources :reactions
  #resources :photos
  #resources :responses
  #resources :comments
  resources :fragments
  #resources :friends
  resources :users
  #resources :countries
  #resources :cities
end
