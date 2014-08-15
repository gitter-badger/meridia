class Ability
  include CanCan::Ability
   #resourcify
  def initialize(user)
  	user.roles.each do |role|
			role.permissions.each do |permission|
				can permission.action.to_sym, permission.subject_class.constantize
			end
		end
	end

end
