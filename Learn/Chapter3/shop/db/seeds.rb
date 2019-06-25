# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create(name: 'Milk (1 liter)', weight: 1000, in_stock: true, price: 0.45, expiration_date: Date.today + 14.days)
Product.create(name: 'Butter (250 g)', weight: 250, in_stock: true, price: 0.75, expiration_date: Date.today + 14.days)
Product.create(name: 'Flour (1 kg)', weight: 1000, in_stock: false, price: 0.45, expiration_date: Date.today + 100.days)
Product.create(name: 'Jelly Babies (6 x 300 g)', weight: 1500, in_stock: true, price: 4.96, expiration_date: Date.today + 1.year)
Product.create(name: 'Super-Duper Cake Mix', in_stock: true, price: 11.12, expiration_date: Date.today + 1.year)
Product.create(name: 'Eggs (12)', in_stock: true, price: 2, expiration_date: Date.today + 7.days)
Product.create(name: 'Peanuts (8 x 200 g bag)', in_stock: false, weight: 1600, price: 17.49, expiration_date: Date.today + 1.year)