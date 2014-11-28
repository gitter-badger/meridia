module ControllerHelpers
  def login
    @user ||= FactoryGirl.create :user
    center =  FactoryGirl.create :center
    center.users << @user
    @user.add_role :admin
    post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
  end
end
