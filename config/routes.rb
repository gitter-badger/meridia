Meridia::Application.routes.draw do



  resources :invoices do
    resources :payments
  end


  resources :payments
  resources :mailboxes do
    resources :tags
  end
  resources :users, only:[:edit,:update] do
  	resources :messengers
	end
  resources :tests
  resources :activities do
    resources :lessons, only:[:create]
  end
  resources :centers 
  resources :attends 
  resources :lessons, only:[:index,:show,:update] 
  get "prospect_grafic", to: "prospect_grafic#index"
 
 	resources :prospects do
    resources :tickets, only: [:create, :update]
  end
  
 
 	resources :vigs do
    resources :tests
  end
  
  get ':vigs_test_id/answers', to: 'answers#index', as: 'answers_all'

  resources :tests do
    resources :answers
  end
  resources :customers
 
  #autneticacion

 	devise_for :users
  authenticated :user do
    root to: "centers#show", :as => "root_center"
  end
  
  devise_scope :user do
    root to: "devise/sessions#new", :as => "unauthenticated"
  end 

  resources :members do   
    resources :probien, only: [:update, :new]
    resources :schedule, only: [:index,:create,:show,:new]
    resources :progress , only: [:index]
    resources :vigs
    resources :medicals
    resources :allergies, only: [ :index, :new, :create, :destroy ]
    resources :signs, only: [ :index, :new, :create, :destroy ]
    resources :medicines, only: [ :index, :new, :create, :destroy ]
    resources :additional_services, only: [ :index]
    resources :families,only: [ :update,:create, :destroy ]
    resources :invoices do
      resources :list_services, only: [:create,:destroy]
  end

    resources :nursing, only: [ :index, :new, :create ] do
      collection do
        get 'step_two', to: 'nursing#step_two'
        get 'step_three', to: 'nursing#step_three'
        get 'step_four', to: 'nursing#step_four'
        get 'step_five', to: 'nursing#step_five'
      end
    end
  end

  namespace 'admin' do
		root to: "users#index", :as => "root_admin"
		resources :additional_services
    resources :users do
			collection do
				post 'new_user'
			end
		end
  	resources :roles
	end

  namespace 'payment' do
    resources :reports   
  end

  namespace 'member' do
    resources :reports   
  end
   namespace 'invoice' do
    resources :reports   
  end
end
