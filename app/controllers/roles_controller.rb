class RolesController < ApplicationController
	
  before_action :set_role, only: [:show, :edit, :update, :destroy]
	def	index	
		@roles = Role.all
	end

	def show
		@role = Role.find(params[:id])
		@permissions = Permission.all
	end

	def	new
		@role = Role.new
	end
	
	def update
		@role.update_attributes!(role_params)
		redirect_to role_path(@role)
	end
	def create
		@role = Role.new(role_params) 
		@role.save
		redirect_to roles_path		
	end

  private
    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:name,:description,:permission_ids=> [])
    end
end
