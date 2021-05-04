Rails.application.routes.draw do
  devise_for :users

  root to:'homes#top'
  get 'homes/about'

  resources:blogs do
   resource :favorites, only: [:create, :destroy]
  end

  resources:users, only:[:index,:show,:edit,:update,:destroy]
  resources:genres, only:[:index,:create,:edit,:update,:destroy]
  
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  
end
