Rails.application.routes.draw do
  devise_for :people
  devise_for :users
  
  resources :people

  root 'angular#show'
end
