class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  config.time_zone = 'America/Mexico_City'
	protect_from_forgery with: :exception
	before_filter  :set_multitenancy
	
	 before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

	def after_sign_in_path_for(resource)
		set_current_client(resource.center)
		request.env['omniauth.origin'] || stored_location_for(resource) || root_center_path
	end	 

	rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end


	def set_current_client(center)
		current_client = Center.find(center)
		Mongoid::Multitenancy.current_tenant = current_client
	end

	private
	def set_multitenancy
		if current_user
			 Mongoid::Multitenancy.current_tenant =  current_user.center if Mongoid::Multitenancy.current_tenant.nil? 
		end
	end
	
	rescue_from CanCan::AccessDenied do |exception|
					flash[:error] = exception.message
					redirect_to root_center_path
	end
	
	protected

  	def layout_by_resource
		if devise_controller?
			"devise"
		end
	end

end
