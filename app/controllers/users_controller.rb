class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end
	
	def new
		@user = User.new
	end
	
	def	new_user
		@user = User.new(center_params)
		if @user.save
			redirect_to users_path
		else
			redirect_to users_path
		end
	end
  
	def show
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_center
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def center_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
