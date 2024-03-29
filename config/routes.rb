Rails.application.routes.draw do

	post '/login', to: 'authentication#create'
	get '/profile', to: 'users#profile'
	post '/profile', to: 'users#profile_update'

  	resources :comments, only: [:create, :update]
  	resources :activity_instances, only: [:create, :update]
  	resources :activities, only: [:show, :index]
	resources :users, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
