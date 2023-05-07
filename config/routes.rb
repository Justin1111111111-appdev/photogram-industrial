Rails.application.routes.draw do
  root "photos#index"


  devise_for :users

  resources :likes
  resources :follow_requests
  resources :comments
  resources :photos

  get ":username/liked" => "photos#liked", as: :liked_photos
  # get ":username/feed" => "photos#liked", as: :liked_photos
  # get ":username/followers" => "photos#liked", as: :liked_photos
  #  get ":username/following" => "photos#liked", as: :liked_photos

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'

    get ":username" => "users#show", as: :user

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
