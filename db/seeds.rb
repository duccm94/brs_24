User.create! name: "test", email: "test@gmail.com", password: "123456",
  password_confirmation: "123456", is_admin: true

10.times do |n|
  name = Faker::Name.name
  email = "test-#{n+1}@gmail.com"
  password = "123456"
  User.create! name: name, email: email, password: password,
    password_confirmation: password
end

10.times do |n|
  name = Faker::Book.genre
  Category.create! name: name
end

30.times do |n|
  title = Faker::Book.title
  publish_date = Faker::Date.backward(100)
  rating = Faker::Number.between(1, 10)
  author = Faker::Book.author
  number_pages = Faker::Number.between(100, 500)
  category_id = Faker::Number.between(1, 10)
  picture = "images/book.png"
  Book.create! title: title, category_id: category_id,
    publish_date: publish_date, rating: rating, author: author,
    number_pages: number_pages, picture: picture
end
