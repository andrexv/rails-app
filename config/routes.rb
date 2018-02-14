Rails.application.routes.draw do
  resources :resource_jobs, only: :create 
end
