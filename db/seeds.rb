# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
puts 'DB cleaned up'

user_0 = User.create(email: 'user0@yopmail.com', password: '123456')
puts "Created user: #{user_0.email}"

user_1 = User.create(email: 'user1@yopmail.com', password: '123456')
puts "Created user: #{user_1.email}"
