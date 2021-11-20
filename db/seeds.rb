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
UserGroup.destroy_all
Collection.destroy_all

puts "\n== Creating users =="

first_user = User.create!(
  email: "first@example.com",
  password: "password123"
)

second_user = User.create!(
  email: "second@example.com",
  password: "password123"
)

puts "\n== Creating collections =="

personal_collection = Collection.create!(
  name: "Personal"
)
group_collection = Collection.create!(
  name: "Group"
)

puts "\n== Creating user groups =="

UserGroup.create(
  collection: personal_collection,
  user: first_user
)

UserGroup.create(
  collection: group_collection,
  user: first_user
)

UserGroup.create(
  collection: group_collection,
  user: second_user
)

puts "\n== Creating feature types =="

subject = FeatureType.create!(
  collection: personal_collection,
  name: "Subjects"
)

FeatureType.create!(
  collection: group_collection,
  name: "Languages"
)

puts "\n== Creating features =="

Feature.create!(
  name: "Arkiane",
  content: "Not sure about his attribute??",
  feature_type: subject,
)

Feature.create!(
  name: "Elite",
  content: "Not sure about his attribute??",
  feature_type: subject,
)

puts "\n== Creating tickets =="

ticket_one = Ticket.create(
  collection: personal_collection,
  date: Date.today,
  title: "MHP",
  description: "Fix layout issue with the parks navigation, Tony has request this to be changed.",
  duration: 60,
  start_time: Time.now + 1.hour
)

ticket_one = Ticket.create(
  collection: group_collection,
  date: Date.today,
  title: "MHP",
  description: "Fix layout issue with the parks navigation, Tony has request this to be changed.",
  duration: 60,
  start_time: Time.now + 1.hour
)
