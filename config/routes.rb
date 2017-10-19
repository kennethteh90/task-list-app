Rails.application.routes.draw do

  # root to: 'task_lists#index'
  root to: 'sessions#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users

  resources :task_lists do
  	resources :tasks do
      put :completed, on: :member
    end
  end
end
