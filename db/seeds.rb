# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
['registered', 'admin'].each do |role|
  Role.find_or_create_by({name: role})
end

User.create!(email:"email@example.com", password:"password", password_confirmation:"password")
admin = User.create!(email:"admin@example.com", password:"password", password_confirmation:"password")
admin.role.name = 'admin'
User.create(email:"gareto@vitaminka.com",password:"merimeri",password_confirmation:"merimeri")
User.create(email:"bambikuche1@vitaminka.com",password:"merimeri",password_confirmation:"merimeri")
User.create(email:"bambikuche2@vitaminka.com",password:"merimeri",password_confirmation:"merimeri")
User.create(email:"bambikuche3@vitaminka.com",password:"merimeri",password_confirmation:"merimeri")
User.create(email:"bambikuche4@vitaminka.com",password:"merimeri",password_confirmation:"merimeri")
User.create(email:"bambikuche5@vitaminka.com",password:"merimeri",password_confirmation:"merimeri")
User.create(email:"bambikuche6@vitaminka.com",password:"merimeri",password_confirmation:"merimeri")
User.create(email:"bambikuche7@vitaminka.com",password:"merimeri",password_confirmation:"merimeri")
User.create(email:"bambikuche8@vitaminka.com",password:"merimeri",password_confirmation:"merimeri")
User.create(email:"bambikuche9@vitaminka.com",password:"merimeri",password_confirmation:"merimeri")
