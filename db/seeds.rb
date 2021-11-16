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
  date: Date.today,
  title: "MHP",
  description: "Fix layout issue with the parks navigation, Tony has request this to be changed.",
  duration: 60,
  start_time: Time.now + 1.hour
)
