# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.destroy_all
User.destroy_all
Chirp.destroy_all
Like.destroy_all

# locations
ldn = Location.create!(name: 'London, England')
pa = Location.create!(name: 'Pennsylvania, USA')
va = Location.create!(name: 'Virginia, USA')
ma = Location.create!(name: 'Massachusetts, USA')
ca = Location.create!(name: 'California, USA')
tn = Location.create!(name: 'Tennessee, USA')
cdmx = Location.create!(name: 'Mexico City, Mexico')

# users
lovelace = User.create!(name: "Ada Lovelace", birth_year: 1815, location_id: ldn.id, password: 'starwars')
hopper = User.create!(name: "Grace Hopper", birth_year: 1906, location_id: pa.id, password: 'starwars')
vaughan = User.create!(name: "Dorothy Vaughan", birth_year: 1910, location_id: va.id, password: 'starwars')
turing = User.create!(name: "Alan Turing", birth_year: 1912, location_id: ldn.id, password: 'starwars')
booth = User.create!(name: "Kathleen Booth", birth_year: 1922, location_id: ldn.id, password: 'starwars')
landin = User.create!(name: "Peter Landin", birth_year: 1930, location_id: ldn.id, password: 'starwars')
hamilton = User.create!(name: "Margaret Hamilton", birth_year: 1936, location_id: ma.id, password: 'starwars')
stallman = User.create!(name: "Richard Stallman", birth_year: 1953, location_id: ma.id, password: 'starwars')
horton = User.create!(name: "Mary Ann Horton", birth_year: 1955, location_id: ca.id, password: 'starwars')
dean = User.create!(name: "Mark Dean", birth_year: 1957, location_id: tn.id, password: 'starwars')
lam = User.create!(name: "Monica Lam", birth_year: 1958, location_id: ca.id, password: 'starwars')
de_icaza = User.create!(name: "Miguel de Icaza", birth_year: 1972, location_id: cdmx.id, password: 'starwars')

# chirps
c9001 = Chirp.create!(
  body: "i play POT OF GREED which allows me to draw two cards from my deck and put them into my hand",
  author_id: lovelace.id
)
c0 = Chirp.create!(
  body: "who is screaming \"log off\" at my house. show yourself, coward. i will never log off",
  author_id: lovelace.id
)
c1 = Chirp.create!(
  body: "hear this trolls: ive been secretly respecting the flag in the privacy of my garage for 12 hrs a day , maxing out its power to insane levels",
  author_id: hopper.id
)
c2 = Chirp.create!(
  body: "every morning I ask the dog \“the usual?\” before pouring her food into her bowl & neither of us thinks it’s funny but that’s showbiz baby",
  author_id: vaughan.id
)
c3 = Chirp.create!(
  body: "How dare you drive the speed limit when I’m late to something due to my own poor time management skills",
  author_id: turing.id
)
c4 = Chirp.create!(
  body: "it is with a heavy heart that i must announce that the celebs are at it again",
  author_id: booth.id
)
c5 = Chirp.create!(
  body: "Food $200\nData $150\nRent $800\nCandles $3,600\nUtility $150\nsomeone who is good at the economy please help me budget this. my family is dying",
  author_id: landin.id
)
c6 = Chirp.create!(
  body: "passed a dog wearing a vest that said \“careful! i’m still learning how to be around people\” and experienced a borderline-spiritual \“same\”",
  author_id: hamilton.id
)
c7 = Chirp.create!(
  body: "hi, grandma? can u come pick me up from my rap battle? it's over. no, i lost. he saw u drop me off & did a pretty devastating rhyme about it",
  author_id: stallman.id
)
c8 = Chirp.create!(
  body: "is there anything more capitalist than a peanut with a top hat, cane, and monocle selling you other peanuts to eat",
  author_id: horton.id
)
c9 = Chirp.create!(
  body: "[burglar gently waking me] you live like this?",
  author_id: dean.id
)
c10 = Chirp.create!(
  body: "How Can Mirrors Be Real If Our Eyes Aren't Real",
  author_id: lam.id
)
c11 = Chirp.create!(
  body: "awfully bold of you to fly the Good Year blimp on a year that has been extremely bad thus far",
  author_id: de_icaza.id
)

# likes
l0 = Like.create!(chirp_id: c0.id, user_id: hopper.id)
l1 = Like.create!(chirp_id: c0.id, user_id: vaughan.id)
l2 = Like.create!(chirp_id: c0.id, user_id: turing.id)
l3 = Like.create!(chirp_id: c0.id, user_id: stallman.id)
l4 = Like.create!(chirp_id: c0.id, user_id: horton.id)
l5 = Like.create!(chirp_id: c0.id, user_id: dean.id)
l6 = Like.create!(chirp_id: c0.id, user_id: lam.id)

l7 = Like.create!(chirp_id: c2.id, user_id: hamilton.id)
l8 = Like.create!(chirp_id: c2.id, user_id: de_icaza.id)

l9 = Like.create!(chirp_id: c3.id, user_id: booth.id)
l10 = Like.create!(chirp_id: c3.id, user_id: horton.id)
l11 = Like.create!(chirp_id: c3.id, user_id: dean.id)
l12 = Like.create!(chirp_id: c3.id, user_id: lam.id)

l13 = Like.create!(chirp_id: c5.id, user_id: lovelace.id)
l14 = Like.create!(chirp_id: c5.id, user_id: hopper.id)
l15 = Like.create!(chirp_id: c5.id, user_id: turing.id)

l15 = Like.create!(chirp_id: c6.id, user_id: landin.id)
l16 = Like.create!(chirp_id: c6.id, user_id: stallman.id)
l17 = Like.create!(chirp_id: c6.id, user_id: dean.id)
l18 = Like.create!(chirp_id: c6.id, user_id: lam.id)

l19 = Like.create!(chirp_id: c9.id, user_id: horton.id)
l20 = Like.create!(chirp_id: c9.id, user_id: dean.id)
l21 = Like.create!(chirp_id: c9.id, user_id: de_icaza.id)
