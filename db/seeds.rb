# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artist.create(name: "Already Late", hometown: "New York")
Artist.create(name: "The Killers", hometown: "Las Vegas")
Artist.create(name: "My Chemical Romance", hometown: "New Jersey")
Artist.create(name: "Megadeth", hometown: "Detroit")
Artist.create(name: "Kanye West", hometown: "Chicago")
Artist.create(name: "Hall and Oates", hometown: "Philadelphia")

Venue.create(name: "Bowery Electric", description: "")
Venue.create(name: "Governer's Ball")
Venue.create(name: "Pianos", description: "A cool place to chill")

Concert.create(name: "Warped Tour")
Concert.create(name: "Already Late Christmas Extravaganzaaa", artist_id: 1, venue_id: 1)
Concert.create(name: "Killers Live", artist_id: 2, venue_id: 2)
Concert.create(name: "Riot Fest", artist_id: 3, venue_id: 2)
Concert.create(name: "lollaoalpoloazaa")

Address.create(street_number: 5301, street_name: "N 12th St.", city: "Philadelphia", state: "PA", zip: 19141)
Address.create(street_number: 123, street_name: "Fake street", city: "Atown", state: "NY", zip: 10890)