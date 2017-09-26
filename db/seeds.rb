# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

["Pedro	Valdez",
"Joshua	Burns",
"Ricky	Welch",
"Courtney	Erickson",
"Horace	Tate",
"Nicholas	Hawkins",
"Bobby	Cruz",
"Vernon	Morris",
"Ronnie	Diaz",
"Dan	Baker",
"Marlon	Howard",
"Malcolm	Lynch",
"Dominic	Simpson",
"Travis	Conner",
"Marcus	Cole",
"Ricardo	Stewart",
"Elias	Fields",
"Tracy	Mclaughlin",
"Enrique	Craig",
"Rick	Blair",
"Nick	Hunt",
"Craig	Wilson",
"Sean	Mcdonald",
"Bryan	Ramos",
"Jose	Sullivan",
"Clifford	Walton",
"Hector	Hughes",
"Kurt	Elliott",
"Clark	Hunter",
"Mike	Christensen",
"Orville	Wolfe",
"Nathan	Vasquez",
"Clayton	Roy",
"Guy	Bates",
"Damon	Kelly",
"Fredrick	Mack",
"Rogelio	Hodges",
"Alex	Moody",
"Jerome	Hicks",
"Tommy	Hansen",
"Clint	Francis",
"Jeffery	Blake",
"Francis	Henderson",
"Keith	Warner",
"Carl	Little",
"Amos	Evans",
"Jerry	Gray",
"Forrest	Ingram",
"Curtis	Day",
"Micheal	Ferguson"].each do |name|
  user = User.create(
    email:"#{name.split(' ').join}@nlbc.com",
    password:"password",
    password_confirmation:"password",
    male: true,
    first_name: name.split(' ').first,
    last_name: name.split(' ').last,
    passion: Passion.order("RANDOM()").first.title,
    city: ["Eindhoven", "Amsterdam", "Rotterdam", "London", "Manchester"].sample
  )
  user.avatar = URI.parse("https://s3-eu-west-1.amazonaws.com/fakepeople/male/256/#{rand(1..58)}.png")
  user.save
end

Passion.all.each do |passion|
  users = User.order("RANDOM()").limit(10)
  challenges = passion.challenges
  challenges.each do |challenge|
    users.each do |user|
      Teacher.create(user: user, challenge: challenge)
    end
  end
end
