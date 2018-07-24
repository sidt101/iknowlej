Rails.application.routes.draw do
  post 'course_enrollment/enroll'

  post 'course_enrollment/unenroll'

  get 'sessions/new'

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/signup',  to: 'users#new'
  resources :users
  resources :courses do
    member do
      delete :delete_document
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
