
99.times do |n|
  fname = Faker::Name.name
  lname = Faker::Name.name
  email = "example-#{n+1}@nativing.fr"
  password = "password"
  User.create!(fname:  fname,
               lname: lname,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end