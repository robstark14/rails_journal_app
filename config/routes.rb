Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :categories do 
    resources :tasks
  end
  
  root 'categories#index'
  get 'categories/:category_id/tasks_today' => 'tasks#tasks_today', as: 'tasks_today'
end
