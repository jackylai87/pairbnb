Rails.application.routes.draw do
  require 'sidekiq/web'
	authenticate :user do
  	mount Sidekiq::Web => '/sidekiq'
	end
  root 'home#index'
  get '/search', to: 'listings#search'
  get 'tags', to: 'listings#index', as: :tag


  resources :listings do
  	resources :comments
  	resources :reservations
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" , registrations: 'registrations'}
  resources :users, :only => [:show]
end