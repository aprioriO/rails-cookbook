# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Recipe.destroy_all if Rails.env.development?

Recipe.create!(
  name: "Spaghetti Carbonara",
  description: "A true Italian Carbonara recipe, it's ready in about 30 minutes. There is no cream....",
  image_url: "https://images.unsplash.com/photo-1530334044505-5b3aa24cb147?q=80&w=2938&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  rating: "3.3"
)

Recipe.create!(
  name: "Lobster ravioli and scampi cream",
  description: "Gourmet Seafood lobster ravioli and scampi cream ...",
  image_url: "https://images.unsplash.com/photo-1464093515883-ec948246accb?q=80&w=2918&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  rating: "2.8"
)

Recipe.create!(
  name: "Salad Bowl",
  description: "A true Italian Salad recipe, it's ready in about 30 minutes. There is no gluten....",
  image_url: "https://images.unsplash.com/photo-1469307670224-ee31d24b6b9a?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  rating: "4.3"
)

Recipe.create!(
  name: "Veggies",
  description: "A true Canadian Salad recipe, it's ready in about 5 minutes. There is no bread....",
  image_url: "https://images.unsplash.com/photo-1494859802809-d069c3b71a8a?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  rating: "4.8"
)
