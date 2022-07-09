Rails.application.routes.draw do

  namespace :admin do
    resources :posts, only: [:show, :destroy] do
      resources :post_comments, only: [:destroy]
    end
  end

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end

  scope module: :public do
    resources :genres, only: [:show]
  end

  scope module: :public do
    resources :stations, only: [:show]
  end

  scope module: :public do
    resources :posts, except: [:index] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
  end

  scope module: :public do
    get "users/current_user" => "users#show"
    patch "users/withdraw" => "users#withdraw"
    resource :users, only: [:edit, :update]
  end

  root to: "public/homes#top"
  get "popular" => "public/homes#popular"
  get "search" => "public/homes#word_search"

  namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update]
  end

  namespace :admin do
    resources :stations, except: [:new, :destroy]
  end

  devise_for :user,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end