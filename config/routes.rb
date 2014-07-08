Rails.application.routes.draw do
	devise_for :users
	resources :users
	get '/users', to: 'users#show'
	patch '/users', to: 'users#update'
	delete '/users', to: 'users#destroy'
	scope :format => true, :constraints => { :format => 'json' } do
		resources :recommendations

		resources :recommendation_groups

		resources :sources

		resources :restaurants
	end

	namespace :admin do
		resources :sources
	end
end
