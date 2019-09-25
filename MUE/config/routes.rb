Rails.application.routes.draw do
  resources :contacts, except: [:edit, :update]
  get 'contacts/:id/join', to: 'contacts#join_new'
  post 'contacts/:id/create' => 'contacts#join_create'



  get 'blogcomments/new'
  post 'blogcomments' => 'blogcomments#create'

  resources :sections
  resources :blogs
  root 'homes#home'
  get 'overview', to: 'homes#overview'
  get 'top', to: 'homes#top'
  get 'schedule/:id', to: 'homes#schedule', as: 'schedule'
  get 'homes/showDetailSchedule'
  resources :homes
  resources :caves
  resources :regions
  resources :prefectures
  resources :cities
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  resources :admins
  resources :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
