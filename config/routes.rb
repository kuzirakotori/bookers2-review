Rails.application.routes.draw do
  get 'articles/index'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users do
    resource :relationships,only: [:create,:destroy]
    get "followings" => "relationships#followings",as: "followings"
    get "followers" => "relationships#followers",as: "followers"
  	get "daily_posts" => "users#daily_posts"
  end  
  resources :books do
    resource :favorites,only: [:create,:destroy]
    resources :book_comments,only: [:create,:destroy]
  end
  get "search" => "searches#search"
  resources :groups do
    resource :group_users,only:[:create,:destroy]
    resource :event_notices,only:[:new,:create]
    get "event_notices" => "event_notices#sent"
  end 
  resources :chats, only: [:show, :create]
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
