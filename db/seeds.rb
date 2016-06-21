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
  title = Faker::Book.title
  publish_date = "publish_date"
  rating = 7
  author = Faker::Book.author
  number_pages = 100
  category_id = 1
  Book.create! title: title, category_id: category_id,
    publish_date: publish_date, rating: rating, author: author,
    number_pages: number_pages
end

20.times do |n|
  name = Faker::Book.genre
  Category.create! name: name
end
