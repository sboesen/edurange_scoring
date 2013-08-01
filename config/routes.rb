EdurangeScoring::Application.routes.draw do

  resources :scenarios do
    resources :attempts
  end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => redirect("/users/sign_in")

  match "/download_key", to: "users#download_key", as: 'download_key'

  devise_for :users
  resources :users
end
