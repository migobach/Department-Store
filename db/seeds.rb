# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  category = Category.create(
    name: Faker::Commerce.department
  )
  20.times do
    category.items.create(
      name: Faker::Commerce.product_name,
      description: Faker::Commerce.material, 
      price: Faker::Commerce.price,
      available: [true, false].sample
    )
  end
end

puts "seeded"