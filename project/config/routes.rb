Rails3BootstrapDeviseCancan::Application.routes.draw do
  get "badge_tier/index"

  get "badge_tier/add"

  get "badge_tier/edit"

  get "badge_tier/delete"

  get "badge/index"

  get "badge/add"

  get "badge/edit"

  get "badge/delete"

  authenticated :user do
    root :to => 'posts#index'
  end
  root :to => "posts#index"

  get "home/user_directory"

  devise_for :users
  resources :users, :posts do
    resources :comments
  end

end