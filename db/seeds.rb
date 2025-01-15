# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "json"
require "open-uri"

puts "Cleaning the Bookmarks DB..."
Bookmark.destroy_all if Rails.env.development?

puts "Cleaning the Recipes DB..."
Recipe.destroy_all if Rails.env.development?

puts "Cleaning the Categories DB..."
Category.destroy_all if Rails.env.development?

puts "Creating new recipes and categories..."

Recipe.create!(
  name: "Coconut Macaroons",
  description: "These chewy coconut macaroons are very simple to make with flaked coconut and easy ingredients you're sure to have at hand. This recipe has won many first-place blue ribbons at my state fair!",
  image_url: "https://images.unsplash.com/photo-1634560604992-7784a29bc419?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  rating: "3.3"
)

Recipe.create!(
  name: "Oat meal Macarons",
  description: "This chocolate macaroon recipe is one of our Christmas favorites for no-fuss, no-bake, coconut-oatmeal-chocolate cookies. You can also freeze these. Enjoy!",
  image_url: "https://images.unsplash.com/photo-1497393001221-abab69e074d1?q=80&w=2938&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  rating: "2.8"
)

Recipe.create!(
  name: "Fruits macaron",
  description: "Macarons are dainty sandwich cookies made with almond flour and meringue and filled with jam, buttercream, or ganache. ",
  image_url: "https://images.unsplash.com/photo-1692106913324-ef53efa2cd56?q=80&w=2948&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  rating: "4.3"
)

Recipe.create!(
  name: "Macaroon Browniess",
  description: "These decadent brownies have a delicious layer of coconut sandwiched between two chocolate layers.",
  image_url: "https://images.unsplash.com/photo-1568241757756-935df2d96f03?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  rating: "4.8"
)

def recipe_builder(id)
  url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{id}"
  meals_serialized = URI.parse(url).read
  meal = JSON.parse(meals_serialized)["meals"][0]
  p meal["strMeal"]

  puts "Creating #{meal["meals"]}"
  Recipe.create!(
    name: meal["strMeal"],
    description: meal["strInstructions"],
    image_url: meal["strMealThumb"],
    rating: rand(2..5.0).floor(1)
  )
end

meals_categories.each do |meal_category|
  url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{meal_category}"
  recipes_serialized = URI.parse(url).read
  recipes = JSON.parse(recipes_serialized)
  recipes["meals"].take(20).each do |recipe|
    p recipe["idMeal"]
    recipe_builder(recipe["idMeal"])
  end
end

puts "Creating Bookmarks and Categories"
dessert1 = Category.create!(name: "Breakfast")
recipe1 = Recipe.all[0]
Bookmark.create!(comment: "Awesome!", recipe: recipe1, category: dessert1)

dessert2 = Category.create!(name: "Gluten free")
recipe2 = Recipe.all[0]
Bookmark.create!(comment: "Brilliant!", recipe: recipe2, category: dessert2)

dessert3 = Category.create!(name: "Lactose free")
recipe3 = Recipe.all[0]
Bookmark.create!(comment: "Good for health!", recipe: recipe3, category: dessert3)

dessert4 = Category.create!(name: "Pancakes")
recipe4 = Recipe.all[0]
Bookmark.create!(comment: "Breakfast the best!", recipe: recipe4, category: dessert4)

dessert5 = Category.create!(name: "Cakes")
recipe5 = Recipe.all[0]
Bookmark.create!(comment: "Delicious!", recipe: recipe5, category: dessert5)

dessert6 = Category.create!(name: "Doughnuts")
recipe6 = Recipe.all[0]
Bookmark.create!(comment: "Sweeeet!", recipe: recipe6, category: dessert6)

meals_categories = ["Dessert"]


puts "Done! Created #{Recipe.all} recipes!"
