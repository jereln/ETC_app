Rails.application.routes.draw do
  devise_for :users

  root 'angular#show'
end
