# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(fname:  "Example",
			       lname: "User",
             email: "example@nativing.org",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             coach: true,
             activated_at: Time.zone.now)

99.times do |n|
  fname  = Faker::Name.fname
  lname = Faker::Name.lname
  email = "example-#{n+1}@nativing.org"
  password = "password"
  User.create!(fname:  fname,
  			       lname: lname,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               coach: true,
               activated_at: Time.zone.now)
end