Rails.application.routes.draw do
  controller :sessions do
    get 'login' => :new
    get 'login/teacher' => :teacher
    post 'login' => :create
    post 'login/teacher' => :create_teacher
    delete 'logout' => :destroy
  end
  get 'users/new'
  resources :contacts, except: [:edit, :update]
  get 'contacts/:id/join', to: 'contacts#join_new'
  post 'contacts/:id/create' => 'contacts#join_create'



  get 'blogcomments/new'
  post 'blogcomments' => 'blogcomments#create'


  get 'blogs/new_category'
  post 'blogs/new_category' => 'blogs#create_category'
  resources :blogs


  resources :sections
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
  resources :admins
  resources :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
