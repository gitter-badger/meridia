class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  
	rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

	def set_current_client(center)
		current_client = Center.find_by_host(center)
		Mongoid::Multitenancy.current_tenant = current_client
	end

	protected

  def layout_by_resource
		if devise_controller?
			"devise"
		end
	end

end
