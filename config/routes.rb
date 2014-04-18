Meridia::Application.routes.draw do
  resources :activities

  resources :families


  resources :centers 
  resources :members
	resources :customers
	
 	devise_for :users
	 
 	authenticated :user do
		root to: "centers#show", :as => "root_center"
	end

	devise_scope :user do
		root to: "devise/sessions#new", :as => "unauthenticated"
	end

	resources :users do
		collection do
			post 'new_user'
		end
	end
	resources :roles

end
