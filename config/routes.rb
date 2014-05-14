Meridia::Application.routes.draw do

  resources :tests
  resources :activities
  resources :centers 
  
	
	resources :vigs do
		resources :progress , only: [:create]
		resources :tests
		resources :probien, only: [:create, :new]
		resources :schedule,only: [:new]
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
  
  resources :members do		
  	resources :schedule, only: [:index,:create,:show]
		resources :progress , only: [:index]
    resources :vigs
    resources :medicals
    resources :allergies, only: [ :index, :new, :create, :destroy ]
    resources :signs, only: [ :index, :new, :create, :destroy ]

    resources :nursing, only: [ :index, :new, :create ] do
      collection do
        get 'step_two', to: 'nursing#step_two'
        get 'step_three', to: 'nursing#step_three'
        get 'step_four', to: 'nursing#step_four'
        get 'step_five', to: 'nursing#step_five'
      end
    end
  end

  resources :users do
    collection do
      post 'new_user'
    end
  end
	
	resources :roles
end
