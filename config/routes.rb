Rails.application.routes.draw do
  resources :reservations

  devise_for :people, controllers: { registrations: 'people/registrations' }, path_prefix: 'my'
	resources :people
  devise_scope :person do
    get 'sign_in', to: 'devise/sessions#new'
  end 
  
  root 'angular#show'
end
