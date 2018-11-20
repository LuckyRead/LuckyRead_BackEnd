Rails.application.routes.draw do
  post 'api/login' => 'user_token#create'
  post 'api/signup' => 'users#signup'
  get  'api/users/current' => 'users#current'
  get  'api/followed' => 'friends#followed'
  get  'api/follower' => 'friends#follower'
  post 'api/users/email_exist' => 'users#email_exist'
  post 'api/users/user_exist' => 'users#user_exist'
  get 'api/users/preferences_sub_topic' => 'users#preferences_sub_topic'
  get 'api/users/preferences_topic' => 'users#preferences_topic'
  get 'api/fragments/something' => 'fragments#something'
  get 'api/users/best' => 'users#best'
  get 'api/fragments/:id' => 'fragments#show'
  get 'api/fragments_pdf/:id' => 'fragments#showpdf'
  get 'api/user_pdf' => 'users#showpdf'
  get 'api/fragments' => 'fragments#index'
  post 'api/preference/add/:id' => 'topics#addone'
  delete 'api/preference/rm/:id' => 'topics#rmone'
  get 'api/preference/add_all' => 'topics#add_all'
  get 'api/photo_id' => 'photos#photo_id'
  patch 'api/photo/set_profile_photo' => 'photos#set_profile_photo'
  patch 'api/user/change_username' => 'users#change_username'
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
  get 'api/user/stat/new_users' => 'users#new_users'
  get 'api/user/stat/user _activity' => 'users#user_activity'
  post 'api/user/stat/user _activityDate' => 'users#user_activityDate'
  post 'api/user/stat/user _activityDate&ID' => 'users#user_activityDate_Id'
  get 'api/friend/stat/friends' => 'friends#friends'
  post 'api/friend/stat/friendsDate&Id' => 'friends#friendsDate_ID'  
  get 'api/fragments/stat/new_fragments' => 'fragments#new_fragments'
  get 'api/fragments/stat/likes_fragments' => 'fragments#likes_fragments'
  get 'api/fragments/stat/dislikes_fragments' => 'fragments#dislikes_fragments'
  get 'api/fragments/stat/percentage_reaction_fragments/:id' => 'fragments#percentage_reaction_fragments'
  get 'api/fragments/stat/five_fragments_more_percentage_likes' => 'fragments#five_fragments_more_percentage_likes'
  delete 'api/user' => 'users#delete'
  get 'api/subtopics/love/:id' => 'topics#love'
  get 'api/friend/ifollow' => 'friends#ifollow'
  post 'api/topic/add_pref/:id' => 'topics#add_all_topic'
  delete 'api/topic/rm_pref/:id' => 'topics#rm_all_topic'
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
  #resources :fragments
  #resources :friends
  #resources :users
  #resources :countries
  #resources :cities
end
