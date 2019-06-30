# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.create(subject: 'A test', published_on: '01.10.2011')
Post.create(subject: 'Another test', published_on: '01.10.2011')
Post.create(subject: 'And yet one more test', published_on: '02.10.2011')
Post.create(subject: 'Last test', published_on: '01.11.2011')
Post.create(subject: 'Very final test', published_on: '01.11.2012')