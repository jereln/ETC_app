Rails.application.routes.draw do
  resources :reservations

  devise_for :people, controllers: { registrations: 'people/registrations' }
  devise_scope :person do
  	get 'sign_in', to: 'devise/sessions#new'
  end
  devise_for :users
  
  root 'angular#show'
	resources :people
end
