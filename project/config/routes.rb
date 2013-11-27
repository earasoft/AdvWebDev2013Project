Rails3BootstrapDeviseCancan::Application.routes.draw do
  resources :badges


  authenticated :user do
    root :to => 'posts#index'
  end
  root :to => "posts#index"

  get "home/user_directory"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks",
                                       :registrations => "users/registrations"}

  resources :users, :posts do
    resources :comments
  end



end