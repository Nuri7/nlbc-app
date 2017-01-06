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
