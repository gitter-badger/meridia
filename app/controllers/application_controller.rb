class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	before_filter :set_center

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

	def set_center
		if current_user
			 Mongoid::Multitenancy.current_tenant =  current_user.center if Mongoid::Multitenancy.current_tenant.nil? 
		end
	end
	protected

  	def layout_by_resource
		if devise_controller?
			"devise"
		end
	end

end
