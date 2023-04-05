Rails.application.routes.draw do
  resources :projects
  
authenticate :user, lambda { |u| u.admin? } do 
  mount Sidekiq::web => "/sidekiq"
end

  devise_for :users
  root to: "projects#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
