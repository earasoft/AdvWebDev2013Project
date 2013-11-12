Rails3BootstrapDeviseCancan::Application.routes.draw do


  authenticated :user do
    root :to => 'posts#index'
  end
  root :to => "posts#index"

  get "home/user_directory"

  devise_for :users
  resources :users, :posts, :badge_tiers do
    resources :comments
  end

end