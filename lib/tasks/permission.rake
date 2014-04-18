namespace :permission do
	desc "initialize permission can-can"
	task :setup_permission => :environment do

		
		def eval_cancan_action(action)
		  case action.to_s
			  when "index", "show", "search"
			    cancan_action = "read"
			    action_desc = I18n.t :read
			  when "create", "new"
			    cancan_action = "create"
			    action_desc = I18n.t :create
			  when "edit", "update"
			    cancan_action = "update"
			    action_desc = I18n.t :edit
			  when "delete", "destroy"
			    cancan_action = "delete"
			    action_desc = I18n.t :delete
			  else
			    cancan_action = action.to_s
			    action_desc = "Other: " << cancan_action
			  end
			  return action_desc, cancan_action
		end

		def write_permission(class_name, cancan_action, name, description, force_id_1 = false)
		    permission = Permission.new
		    permission.subject_class =  class_name
		    permission.action = cancan_action
		    permission.name = name
		    permission.description = description
		    permission.save
		end


		Permission.destroy_all
	  controllers = Dir.new("#{Rails.root}/app/controllers").entries
	  controllers.each do |controller|
	    if controller =~ /_controller/
	      foo_bar = controller.camelize.gsub(".rb","").constantize.new
	    end
	  end
	  # You can change ApplicationController for a super-class used by your restricted controllers
	  ApplicationController.subclasses.each do |controller|
	      controller.action_methods.each do |action|
					clazz = controller.to_s.gsub("Controller","").classify 
	        if action.to_s.index("_callback").nil?
	          action_desc, cancan_action = eval_cancan_action(action)
	          write_permission(clazz, cancan_action, action ,"")
	        end
	    end
	  end




	end
end
