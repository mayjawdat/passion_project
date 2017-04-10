require 'faker'

User.destroy_all
Cat.destroy_all

cats = []

15.times do 
  cats << Cat.create(name: Faker::Cat.name, breed: Faker::Cat.breed, age: rand(1..8))
end

people = []

15.times do 
  people << User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: Faker::Internet.password(8, 10))
end

40.times do
  Order.create(user_id: people.sample.id, cat_id: cats.sample.id)
end