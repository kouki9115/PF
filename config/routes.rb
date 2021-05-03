Rails.application.routes.draw do
  devise_for :users

  root to:'homes#top'
  get 'homes/about'

  resources:blogs
  resources:users, only:[:index,:show,:edit,:update,:destroy]
  resources:genres, only:[:index,:create,:edit,:update,:destroy]

end
