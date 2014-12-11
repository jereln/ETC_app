Rails.application.routes.draw do
  devise_for :people
  devise_scope :person do
  	get 'sign_in', to: 'devise/sessions#new'
  end
  devise_for :users
  
  root 'angular#show'
	resources :people
end
