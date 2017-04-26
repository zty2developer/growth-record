Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

	get '/about' => 'posts#about'
	get '/contact' => 'posts#contact'
	get '/blog' => 'blogs#index'
	post '/feedbacks' => 'feedbacks#create'

  resources :posts

  devise_for :users

  root "posts#index"
end
