# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "admin@example.com", password: "admin@example.com",password_confirmation: "admin@example.com")
User.create(email: "student@example.com", password: "student@example.com",password_confirmation: "student@example.com")
User.update_all confirmed_at: DateTime.now

Classroom.create(name: "Room1")
Classroom.create(name: "Room2")
Classroom.create(name: "Room3")

Service.create(name: "Math", duration: 45 , client_price: 0)
Service.create(name: "Massage", duration: 45 , client_price: 0)
Service.create(name: "Yoga", duration: 45 , client_price: 0)