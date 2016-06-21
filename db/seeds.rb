User.create! name: "test", email: "test@gmail.com", password: "123456",
  password_confirmation: "123456", is_admin: true

99.times do |n|
  name = Faker::Name.name
  email = "test-#{n+1}@gmail.com"
  password = "123456"
  User.create! name: name, email: email, password: password,
    password_confirmation: password
end
