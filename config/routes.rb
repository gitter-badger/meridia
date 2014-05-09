Meridia::Application.routes.draw do

  resources :tests
  resources :activities
  resources :families
  resources :centers 
 
 	resources :members do		
		resources :vigs
		resources :schedule
	end
	
	resources :vigs do
		resources :progress	
		resources :tests
		resources :probien
		resources :schedule
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

  resources :members do		
    resources :vigs
    resources :medicals
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
