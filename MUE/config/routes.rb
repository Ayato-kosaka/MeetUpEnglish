Rails.application.routes.draw do
  get 'overview', to: 'homes#overview'
  get 'homes/schedule'
  resources :caves
  resources :regions
  resources :homes
  root 'homes#home'
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
