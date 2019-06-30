# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

manh = User.create(firstName: "Tran Dao", lastName: "Si Manh", email: "trandaosimanh@gmail.com", password: "123456")
quan = User.create(firstName: "Le", lastName: "Minh Quan", email: "leminhquan@gmail.com", password: "123456")
chau = User.create(firstName: "Le Nguyen", lastName: "Ngan Chau", email: "lenguyennganchau@gmail.com", password: "123456")
quynh = User.create(firstName: "Diep", lastName: "Phuong Quynh", email: "diepphuongquynh@gmail.com", password: "123456")
faye = User.create(firstName: "Wong",lastName: "Faye", email: "fayewong@gmail.com", password: "123456")

album1 = Album.create(name: "Album1", User: manh)
album2 = Album.create(name: "Album2", User: quan)
album3 = Album.create(name: "Album3", User: quynh)
album4 = Album.create(name: "Album4", User: chau)
album5 = Album.create(name: "Album5", User: faye)

