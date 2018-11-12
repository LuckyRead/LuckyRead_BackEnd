Rails.application.routes.draw do
  post 'api/login' => 'user_token#create'
  post 'api/signup' => 'users#signup'
  get  'api/users/current' => 'users#current'
  get  'api/followed' => 'friends#followed'
  get  'api/follower' => 'friends#follower'
  post 'api/users/email_exist' => 'users#email_exist'
  post 'api/users/user_exist' => 'users#user_exist'
  post 'api/users/preferences_sub_topic' => 'users#preferences_sub_topic'
  post 'api/users/preferences_topic' => 'users#preferences_topic'
  get 'api/fragments/something' => 'fragments#something'
  get 'api/users/best' => 'users#best'
  get 'api/fragments/:id' => 'fragments#show'
  get 'api/fragments_pdf/:id' => 'fragments#showpdf'
  get 'api/fragments' => 'fragments#index'
  post 'api/preference/add' => 'preferences#add'
  get 'api/preference/add_all' => 'preferences#add_all'
  get 'api/photo_id' => 'photos#photo_id'
  patch 'api/photo/set_profile_photo' => 'photos#set_profile_photo'
  post 'api/login/fb' => 'users#login_fb'
  post 'api/login/ggle' => 'users#login_ggle'
  post 'api/topic/add' => 'topics#add'
  get 'api/sub_topic/:topic_id' => 'topics#sub_topic'
  delete 'api/users/delete_temp' => 'users#delete_temp'
  post 'api/photo/upload' => 'photos#upload'
  get 'api/photo/:id' => 'photos#show'
  get 'api/user/info' => 'users#info'
  patch 'api/user/change_password' => 'users#change_password'
  patch 'api/user/change_talk' => 'users#change_talk'
  post 'api/user/send_reset_password' => 'users#send_reset_password'
  post 'api/friend/follow' => 'friends#follow'
  post 'api/friend/unfollow' => 'friends#unfollow'
  get 'api/friend/random' => 'friends#random'
  get 'favicon' => 'photos#favicon'
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
