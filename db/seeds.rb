# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file .env file.#puts 'ROLES'
#YAML.load(ENV['ROLES']).each do |role|
#  Role.mongo_session['roles'].insert({ :name => role })
#  puts 'role: ' << role
#end


puts 'DEFAULT USERS'

user = User.create! :name => 'Admin General', :email => 'master@meridia.mx', :password =>"123456789", :password_confirmation => '123456789'

puts 'user: ' << user.name

center = Center.create! name: "Meridia Amores", address: "Amores 1209", phone: "555-555"

puts 'Center: ' << center.name


admin_amores = User.create! name: "Admin_Amores", email: "admin_amores@meridia.mx", password:"123456789", password_confirmation: "123456789", center_id: Center.first.id


