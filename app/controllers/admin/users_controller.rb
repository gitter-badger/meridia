class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
	before_action :set_user, only: [:show, :update]
  layout 'admin'
	def index
    @users = User.all
  end
	
	def new
		@user = User.new
	end
	
	def	new_user
		@user = User.new(center_params)
		if @user.save
			redirect_to admin_users_path
		else
			redirect_to admin_users_path
		end
	end
  
	def show
		@prof = Role.all
	end

	def update
		@user.update_attributes(center_params)
		redirect_to admin_user_path(@user)
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def center_params
      params.require(:user).permit(:name, :email, :password, :password_confirmationi, :role_ids =>[])
    end

end

