Rails.application.routes.draw do
  post 'api/login' => 'user_token#create'
  post 'api/signup' => 'users#signup'
  get  'api/users/current' => 'users#current'
  get  'api/myfriend/:username' => 'friends#myfriend'
  post 'api/users/email_exist' => 'users#email_exist'
  post 'api/users/user_exist' => 'users#user_exist'
  post 'api/users/preferences' => 'users#preferences'
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
