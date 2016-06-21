User.create! name: "test", email: "test@gmail.com", password: "123456",
  password_confirmation: "123456", is_admin: true

99.times do |n|
  name = Faker::Name.name
  email = "test-#{n+1}@gmail.com"
  password = "123456"
  User.create! name: name, email: email, password: password,
    password_confirmation: password
end

50.times do |n|
  title  = Faker::Name.name
  publish_date = "publish_date"
  rating = 7
  author = "author"
  number_pages = 100
  category_id = 1
  Book.create! title:  title, category_id: category_id, publish_date: publish_date,
    rating: rating, author: author, number_pages: number_pages
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
