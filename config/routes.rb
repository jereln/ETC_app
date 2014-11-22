Rails.application.routes.draw do
  devise_for :users

  resources :people

  root 'angular#show'
end
