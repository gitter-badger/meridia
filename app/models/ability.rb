class Ability
  include CanCan::Ability
   resourcify
  def initialize(user)
  	user.roles.each do |permission|
			if permission.subject_id.nil?
				can permission.action.to_sym, permission.subject_class.constantize
			else
				can permission.action.to_sym, permission.subject_class.constantize, :id => permission.subject_id
			end
		end
	
	end

end
