class Ability
  include CanCan::Ability
   #resourcify
 
  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
    else
      user.roles.each do |role|
        role.permissions.each do |permission|
          can permission.action.to_sym, permission.subject_class.constantize
        end
      end
    end
  end
end
