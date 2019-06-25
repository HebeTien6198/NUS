# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

manh = User.create(name: "Tran Dao Si Manh", email: "trandaosimanh@gmail.com")
quan = User.create(name: "Le Minh QUan", email: "leminhquan@gmail.com")
chau = User.create(name: "Le Nguyen Ngan Chau", email: "lenguyennganchau@gmail.com")
quynh = User.create(name: "Diep Phuong Quynh", email: "diepphuongquynh@gmail.com")
faye = User.create(name: "Faye Wong", email: "fayewong@gmail.com")

album1 = Album.create(name: "Album1", User: manh)
album2 = Album.create(name: "Album2", User: quan)
album3 = Album.create(name: "Album3", User: quynh)
album4 = Album.create(name: "Album4", User: chau)
album5 = Album.create(name: "Album5", User: faye)

