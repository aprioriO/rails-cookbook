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

puts "Cleaning the DB..."
Recipe.destroy_all if Rails.env.development?

puts "Creating new recipes and categories..."
meals_categories = ["Dessert"]

def recipe_builder(id)
  url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{id}"
  meals_serialized = URI.parse(url).read
  meal = JSON.parse(meals_serialized)
  p meal["meals"][0]["strMeal"]
end

meals_categories.each do |meal_category|
  url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=#{meal_category}"
  recipes_serialized = URI.parse(url).read
  recipes = JSON.parse(recipes_serialized)
  recipes["meals"].each do |recipe|
    p recipe["idMeal"]
  end
end


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



puts "Done! Created #{Recipe.all} recipes!"
