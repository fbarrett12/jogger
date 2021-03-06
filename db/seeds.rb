# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Post.destroy_all
User.reset_pk_sequence
Post.reset_pk_sequence

User.create(user_name: "u1", password: "u1", password_confirmation: "u1")
User.create(user_name: "u2", password: "u2", password_confirmation: "u2")
User.create(user_name: "u3", password: "u3", password_confirmation: "u3")
User.create(user_name: "u4", password: "u4", password_confirmation: "u4")
User.create(user_name: "u5", password: "u5", password_confirmation: "u5")


Post.create(title: "First", body:"First sample post", user_id: 1)
Post.create(title: "Second", body:"Second sample post", user_id: 2)
Post.create(title: "Third", body:"Third sample post", user_id: 3)
Post.create(title: "Fourth", body:"Fourth sample post", user_id: 4)
Post.create(title: "Fifth", body:"Fifth sample post", user_id: 5)

puts "seeding complete"