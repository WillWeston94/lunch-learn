# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.create!(name: "Basil", email: "BasilofBakerStreet@test.com", password: "elementary", password_confirmation: "elementary")
favorite = Favorite.create!(country: "Deutschland", recipe_link: "https://www.tastingtable.com/", recipe_title: "German Chocolate Cake", user_id: user.id)
favorite_2 = Favorite.create!(country: "England", recipe_link: "https://www.tastingtable.com/", recipe_title: "Mrs. Judson's Cheese Crumpet", user_id: user.id)
