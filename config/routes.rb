Meridia::Application.routes.draw do

  resources :tests
  resources :activities
  resources :families
  resources :centers 
 
 	resources :members do		
		resources :vigs
	end
	
	resources :vigs do
		resources :progress	
		resources :tests
	end
	
	get ':vigs_test_id/answers', to: 'answers#index', as: 'answers_all'
	resources :tests do
		resources	:answers
	end
	
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
