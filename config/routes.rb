Rails.application.routes.draw do
  resources :subtopics
  resources :cities
  resources :countries
  resources :photos
  resources :responses
  resources :comments
  resources :topics
  resources :fragments
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
