# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 =
  User.create(
    email: "user1@gmail.com",
    password: "valid1",
    password_confirmation: "valid1",
  )

user2 =
  User.create(
    email: "user2@gmail.com",
    password: "valid1",
    password_confirmation: "valid1",
  )

team = Team.new(name: "Team1")
team.members.create(user: user1, roles: { admin: true })

team = Team.new(name: "Team2")
team.members.create(user: user1, roles: { admin: true })

team = Team.new(name: "Team2")
team.members.create(user: user2, roles: { admin: true })

team = Team.new(name: "Team2")
team.members.create(user: user2, roles: { admin: true })
