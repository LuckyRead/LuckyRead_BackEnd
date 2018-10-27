Rails.application.routes.draw do
  post 'api/login' => 'user_token#create'
  post 'api/signup' => 'users#signup'
  get  'api/users/current' => 'users#current'
  get  'api/myfriend/:username' => 'friends#myfriend'
  post 'api/users/email_exist' => 'users#email_exist'
  post 'api/users/user_exist' => 'users#user_exist'
  post 'api/users/preferences_sub_topic' => 'users#preferences_sub_topic'
  post 'api/users/preferences_topic' => 'users#preferences_topic'
  get 'api/fragments/something' => 'fragments#something'
  get 'api/users/best' => 'users#best'
  get 'api/fragments/:id' => 'fragments#show'
  get 'api/fragments/:id.pdf' => 'fragments#showpdf'
  get 'api/fragments' => 'fragments#index'
  post 'api/preference/add' => 'preferences#add'
  get 'api/preference/add_all' => 'preferences#add_all'
  post 'api/topic/add' => 'topics#add'
  get 'api/sub_topic/:topic_id' => 'topics#sub_topic'
  delete 'api/users/delete_temp' => 'users#delete_temp'
  post 'api/photo/upload' => 'photos#upload'
  get 'api/photo/:id' => 'photos#show'
  root :to => 'responses#api_test'
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
