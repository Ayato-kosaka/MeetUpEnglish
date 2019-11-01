Rails.application.routes.draw do




  scope module: 'sessions' do #controller folder name
    namespace :login do
      get '' => :new
      post '' => :create
      get 'teacher' => :teacher
      post 'teacher' => :signin_teacher
    end
    scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
      namespace :signup do
        get 'student' => :signup_student
        post 'student' => :create_student
        get 'teacher' => :signup_teacher
        post 'teacher' => :create_teacher
      end
    end
    delete 'logout' => :destroy
  end

  scope module: 'users' do
    resources :account, only: [:index]
  end

  namespace 'teacher' do
    resources :account, only: [:index]
    resources :schedule, param: :encoded_id
    scope module: 'other' do
      get 'new_my_cafe' => :newCafe, as: 'newCafe_other'
    end
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
  resources :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
