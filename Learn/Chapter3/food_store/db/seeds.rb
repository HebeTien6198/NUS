# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

fruits = Category.create(name: "Fruits")
vegetables = Category.create(name: "Vegetables")
jams = Category.create(name: "Jams")
fruits.products.create(name: "Apple", price: 1)
fruits.products.create(name: "Banana", price: 2)
fruits.products.create(name: "Pineapple", price: 3)
fruits.products.create(name: "Raspberry", price: 1)
fruits.products.create(name: "Strawberry", price: 1)
vegetables.products.create(name: "Potato", price: 2)
vegetables.products.create(name: "Carrot", price: 1)
vegetables.products.create(name: "Broccoli", price: 2)
vegetables.products.create(name: "Cauliflower", price: 1)
jams.products.create(name: "Strawberry", price: 1)
jams.products.create(name: "Raspberry", price: 1)