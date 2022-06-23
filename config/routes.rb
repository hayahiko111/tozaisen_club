Rails.application.routes.draw do
  namespace :public do
    get 'posts/index'
    get 'posts/new'
    get 'posts/edit'
  end
  scope module: :public do
    get "users/current_user" => "users#show"
    patch "users/withdraw" => "users#withdraw"
    resource :users, only: [:edit, :update]
  end

  root to: "public/homes#top"
  get "homes/popular" => "public/homes#popular"

  namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update]
  end

  namespace :admin do
    resources :stations, only:[:new, :create, :index, :edit, :update]
  end

  devise_for :user,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end