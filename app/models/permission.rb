class Permission
  include Mongoid::Document
  field :name, type: String
  field :action, type: String
  field :subject_class, type: String
  field :description, type: String
	has_and_belongs_to_many :roles
end
