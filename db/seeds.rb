# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
SubjectGroup.destroy_all
Subject.destroy_all
MemberGroup.destroy_all
Member.destroy_all
Language.destroy_all
LanguageGroup.destroy_all
Category.destroy_all
Ticket.destroy_all
User.destroy_all

puts "\n== Creating users =="

user = User.create!(
  email: "test@example.com",
  password: "Secret123"
)

puts "\n== Creating categories =="

mhp = Category.create(
  user: user,
  name: "MHP",
  colour: "#65e33b"
)

mcf = Category.create(
  user: user,
  name: "MCF",
  colour: "#6cc9f5"
)

mvf = Category.create(
  user: user,
  name: "MVF",
  colour: "#ffbf36"
)

my3c = Category.create(
  user: user,
  name: "My3c",
  colour: "#c3f1fa"
)

puts "\n== Creating subjects =="

elite = Subject.create(
  user: user,
  name: "Elite",
  content: "Some information about Elite."
)

avantio = Subject.create(
  user: user,
  name: "Avantio",
  content: "Some information about Avantio."
)

arkiane = Subject.create(
  user: user,
  name: "Arkiane",
  content: "Some information about Arkiane."
)

interhome = Subject.create(
  user: user,
  name: "Interhome",
  content: "Some information about Interhome."
)

puts "\n== Creating members =="

david = Member.create(
  name: "David",
  colour: "#f5aa42",
  user: user,
)

jane = Member.create(
  name: "Jane",
  colour: "#fc68e6",
  user: user,
)

puts "\n== Creating tickets =="

ticket_one = Ticket.create(
  user: user,
  category: mhp,
  date: Date.new(2021, 10, 18),
  title: "MHP",
  description: "Fix layout issue with the parks navigation, Tony has request this to be changed.",
  duration: 15,
  start_time: Time.new(2021, 10, 18, 10, 15, 0)
)

ticket_two = Ticket.create(
  user: user,
  category: mcf,
  date: Date.new(2021, 10, 18),
  title: "MHP",
  description: "Had to pair as I needed help on a ticket, the issue was much harder that I first thought.",
  duration: 90,
  start_time: Time.new(2021, 10, 18, 10, 30, 0)
)

ticket_three = Ticket.create(
  user: user,
  category: mcf,
  date: Date.new(2021, 10, 18),
  title: "MHP",
  description: "Had to pair as I needed help on a ticket, the issue was much harder that I first thought.",
  duration: 120,
  start_time: Time.new(2021, 10, 18, 14, 30, 0)
)

ticket_four = Ticket.create(
  user: user,
  category: mvf,
  date: Date.new(2021, 10, 18),
  title: "MHP",
  resource: "https://www.youtube.com",
  description: "Made some change to the home page.",
  duration: 30,
  start_time: Time.new(2021, 10, 18, 13, 30, 0)
)

ticket_five = Ticket.create(
  user: user,
  category: my3c,
  commit: "https://www.github.com",
  date: Date.new(2021, 10, 18),
  title: "MHP",
  description: "This is anther ticket I've created for some test data so it doesn't look poop...",
  duration: 75,
  start_time:Time.new(2021, 10, 18, 12, 0, 0)
)

puts "\n== Creating member groups =="

MemberGroup.create(
  member: jane,
  ticket: ticket_four
)

MemberGroup.create(
  member: jane,
  ticket: ticket_five
)

puts "\n== Creating subject groups =="

SubjectGroup.create(
  subject: avantio,
  ticket: ticket_one
)

SubjectGroup.create(
  subject: avantio,
  ticket: ticket_one
)

SubjectGroup.create(
  subject: avantio,
  ticket: ticket_two
)

SubjectGroup.create(
  subject: avantio,
  ticket: ticket_three
)

SubjectGroup.create(
  subject: arkiane,
  ticket: ticket_three
)

SubjectGroup.create(
  subject: elite,
  ticket: ticket_three
)

SubjectGroup.create(
  subject: arkiane,
  ticket: ticket_four
)

SubjectGroup.create(
  subject: avantio,
  ticket: ticket_five
)

puts "\n== Creating languages =="

css = Language.create(
  user: user,
  name: "css"
)

js = Language.create(
  user: user,
  name: "js"
)

ruby = Language.create(
  user: user,
  name: "ruby"
)

puts "\n== Creating language groups =="

LanguageGroup.create(
  language: ruby,
  ticket: ticket_one
)
