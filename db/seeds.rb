# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ticket.destroy_all

Ticket.create(
  date: Date.new(2021, 10, 18),
  title: "MHP",
  description: "Made some change to the home page.",
  duration: 60,
  start_time: Time.new(2021, 10, 18, 8, 30, 0)
)

Ticket.create(
  date: Date.new(2021, 10, 18),
  title: "MHP",
  description: "This is anther ticket I've created for some test data so it doesn't look poop...",
  duration: 45,
  start_time:Time.new(2021, 10, 18, 9, 30, 0)
)
Ticket.create(
  date: Date.new(2021, 10, 18),
  title: "MHP",
  description: "Fix layout issue with the parks navigation, Tony has request this to be changed.",
  duration: 15,
  start_time: Time.new(2021, 10, 18, 10, 15, 0)
)
Ticket.create(
  date: Date.new(2021, 10, 18),
  title: "MHP",
  description: "Had to pair as I needed help on a ticket, the issue was much harder that I first thought.",
  duration: 90,
  start_time: Time.new(2021, 10, 18, 10, 30, 0)
)
