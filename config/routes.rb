Rails.application.routes.draw do
  get 'event_mails/new'
  get 'event_mails/create'
  get 'event_mails/show'
  get 'group_users/create'
  get 'group_users/destroy'
  get 'groups/index'
  get 'groups/show'
  get 'groups/edit'
  get 'relationships/followings'
  get 'relationships/followers'
  get 'book_comments/create'
  get 'book_comments/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users do
    resource :relationships,only: [:create,:destroy]
    get "followings" => "relationships#followings",as: "followings"
    get "followers" => "relationships#followers",as: "followers"
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
