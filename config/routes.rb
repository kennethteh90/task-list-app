Rails.application.routes.draw do
  root to: 'task_lists#index'

  resources :task_lists do
  	resources :tasks
  end
end
