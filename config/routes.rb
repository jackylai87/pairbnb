Rails.application.routes.draw do
  require 'sidekiq/web'
	authenticate :user do
  	mount Sidekiq::Web => '/sidekiq'
	end
  root 'pages#homepage'
  get '/privacy', to: 'pages#privacy'
  get '/term', to: 'pages#term'
  get '/search', to: 'listings#search'
  get 'tags/:tag', to: 'listings#index', as: :tag
  get 'tags', to: 'listings#index', as: :tags

  resources :listings do
  	resources :comments
  	resources :reservations
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" , registrations: 'registrations'}
  resources :users, :only => [:show]
end