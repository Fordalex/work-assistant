# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Feature.destroy_all
FeatureGroup.destroy_all
FeatureType.destroy_all
Ticket.destroy_all
User.destroy_all

puts "\n== Creating users =="

user = User.create!(
  email: "test@example.com",
  password: "Secret123"
)

puts "\n== Creating tickets =="

ticket_one = Ticket.create(
  user: user,
  category: mhp,
  date: Date.today,
  title: "MHP",
  description: "Fix layout issue with the parks navigation, Tony has request this to be changed.",
  duration: 15,
  start_time: Time.now + 1.hour
)

ticket_two = Ticket.create(
  user: user,
  category: mcf,
  date: Date.today,
  title: "MHP",
  description: "Had to pair as I needed help on a ticket, the issue was much harder that I first thought.",
  duration: 90,
  start_time: Time.now - 1.hour
)

ticket_three = Ticket.create(
  user: user,
  category: mcf,
  date: Date.today,
  title: "MHP",
  description: "Had to pair as I needed help on a ticket, the issue was much harder that I first thought.",
  duration: 120,
  start_time: Time.now + 3.hour
)

ticket_four = Ticket.create(
  user: user,
  category: mvf,
  date: Date.today,
  title: "MHP",
  resource: "https://www.youtube.com",
  description: "Made some change to the home page.",
  duration: 30,
  start_time: Time.new + 5.hour
)

ticket_five = Ticket.create(
  user: user,
  category: my3c,
  commit: "https://www.github.com",
  date: Date.today,
  title: "MHP",
  description: "This is anther ticket I've created for some test data so it doesn't look poop...",
  duration: 75,
  start_time:Time.new - 7.hour
)

