Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

	get '/about' => 'posts#about'
	get '/contact' => 'posts#contact'
	get '/blog' => 'blogs#index'
	get '/category' => 'blogs#category'
	post '/feedbacks' => 'feedbacks#create'

  resources :posts
	resources :categories
	resources :feedbacks
	resources :comments

  devise_for :users

  root "posts#index"
end
