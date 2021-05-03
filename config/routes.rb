Rails.application.routes.draw do
  get 'genres/index'
  get 'genres/edit'
  get 'blogs/new'
  get 'blogs/index'
  get 'blogs/show'
  get 'blogs/edit'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  
  root to:'homes#top'

  get 'homes/about'

end
