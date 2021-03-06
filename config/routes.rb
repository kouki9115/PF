Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :sessions => 'users/sessions',
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    # get "sign_in", :to => "users/sessions#new"     #test用
    # get "sign_out", :to => "users/sessions#destroy"   #test用
  end

  root to: 'homes#top'
  get 'homes/about'

  resources :contacts, only: [:new, :create]

  resources :blogs do
    collection do
      get 'search'
      get "sort"
    end
    resources :blog_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end
  put "/users/:id/withdrawal" => "users#withdrawal", as: 'users_withdrawal' # 退会機能

  resources :genres, only: [:index, :create, :edit, :update, :destroy]

  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
end
