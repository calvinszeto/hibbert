Rails.application.routes.draw do
	# TODO: Add angular app
	# root :to =>

	devise_for :users

	scope :format => true, :constraints => { :format => 'json' } do
		get '/users', to: 'users#show'
		patch '/users', to: 'users#update'
		post '/users', to: 'users#create'
		delete '/users', to: 'users#destroy'

		get '/restaurants', to: 'restaurants#index'
		get '/restaurants/:id', to: 'restaurants#show'

		get '/recommendation_groups/:id', to: 'recommendation_groups#show'

		get '/sources', to: 'sources#index'
		get '/sources/:id', to: 'sources#show'

		devise_scope :user do
			match '/sessions' => 'sessions#create', :via => :post
			match '/sessions' => 'sessions#destroy', :via => :delete
		end

		namespace :admin do
			resources :sources

			resources :recommendation_groups

			resources :sources

			resources :restaurants
		end
	end
end
