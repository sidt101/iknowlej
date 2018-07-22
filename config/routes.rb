Rails.application.routes.draw do
  get 'course_enrollment/enroll'

  get 'course_enrollment/unenroll'

  get 'sessions/new'

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/signup',  to: 'users#new'
  resources :users
  resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
