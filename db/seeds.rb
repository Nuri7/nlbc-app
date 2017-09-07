# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(email:"email@example.com", password:"password", password_confirmation:"password")
User.create!(email:"admin@example.com", password:"password", password_confirmation:"password", role: 'admin')
User.create!(email:"nuri@nlbc.com", password:"password", password_confirmation:"password", role: 'admin')
1.upto(10) do |i|
  User.create(email:"test_#{i}@test-email.com",password:"password",password_confirmation:"password")
end

["QA", "Developer", "Teacher"].each do |passion|
  name = passion.downcase
  Passion.create(title: name)
end

["Java_and_BDD1", "Java_and_BDD2", "Performance_testing", "Mobile_testing", "Javascript_and_Protractor"].each do |bootcamp|
  name = bootcamp.downcase
  Bootcamp.create(title: name)
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
