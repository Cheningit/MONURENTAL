# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

puts "cleaning your db.....:)"
Building.destroy_all

puts "cleaning your db...."
User.destroy_all

# only run once, no need to delete them
puts "creating users......"
user1 = User.new
user1.email = 'russell@email.com'
user1.password = 'taawktljasktlw4aaglj'
user1.save!

user2 = User.new
user2.email = 'tony@example.com'
user2.password = 'taawktljasktlw4aaglj'
user2.save!

user3 = User.new
user3.email = 'victor@homepage.com'
user3.password = '#$taawktljasktlw4aaglj'
user3.save!

user4 = User.new
user4.email = 'clement@england.com'
user4.password = '#$taawktljasktlw4aaglj'
user4.save!


puts "creating buildings...."


# availability has to be an actual date

eiffel_tower = {address: "Champ de Mars, 5 Av. Anatole France, 75007 Paris, France", name: "eiffel tower", beds: 5, price:100000, availability: "5/7/2023", user: user1}
taj_mahal = {address: "Dharmapuri, Forest Colony, Tajganj, Agra, Uttar Pradesh 282001, India", name: "taj mahal", beds: 5, price:10, availability: "5/8/2023", user: user2}
great_wall_of_china = {address: "CHJC+Q4 Sanduhe Town, Huairou District, Beijing, China", name: "great wall of china", beds: 5, price:90000, availability: "10/7/2023", user: user2}
statue_of_liberty = {address: "New York, NY 10004", name: "statue of liberty", beds: 5, price:100000, availability: "5/7/2023", user: user1}
machu_pichu = {address: "QGF3+F3 Aguas Calientes, Peru", name: "machu pichu", beds: 5, price:100000, availability: "20/7/2023", user: user2}
sydney_opera_house = {address: "Bennelong Point, Easy walk from Circular Quay Train Station, Sydney, AU 2000", name: "sydney opera house", beds: 5, price:100000, availability: "6/7/2023", user: user1}
pyramids_of_giza = {address: "30 Lebanon St., MOHANDESEEN", name: "pyramids of giza", beds: 5, price:100000, availability: "9/7/2023", user: user1}

# cloudinary section
file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686058044/Tour_Eiffel_Wikimedia_Commons__28cropped_29_m76qge.jpg")
building = Building.new(eiffel_tower)
building.photos.attach(io: file, filename: "eiffel_tower.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686058113/Taj_Mahal_2C_Agra_2C_India_edit3_npr4rg.jpg")
building = Building.new(taj_mahal)
building.photos.attach(io: file, filename: "taj_mahal.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686058391/Great-Wall-Of-China-1600x900_umlckc.jpg")
building = Building.new(great_wall_of_china)
building.photos.attach(io: file, filename: "great_wall_of_china.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686058199/Lady_Liberty_under_a_blue_sky__28cropped_29_o13gyk.jpg")
building = Building.new(statue_of_liberty)
building.photos.attach(io: file, filename: "statue_of_liberty.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686058219/Machu_Picchu_2C_Peru_qkn1vy.jpg")
building = Building.new(machu_pichu)
building.photos.attach(io: file, filename: "machu_pichu.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686058251/Sydney_Australia.__2821339175489_29_viojab.jpg")
building = Building.new(sydney_opera_house)
building.photos.attach(io: file, filename: "sydney_opera_house.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686058365/Kheops-Pyramid_f53vtl.jpg")
building = Building.new(pyramids_of_giza)
building.photos.attach(io: file, filename: "pyramids_of_giza.jpg", content_type: "image/jpg")
building.save!

puts "cleaning your booking db.....:)"
Booking.destroy_all

puts "Creating booking"
booking1 = Booking.new( status: "unconfirmed", date: "whenever", user: user1, building: Building.first)
booking2 = Booking.new( status: "unconfirmed", date: "whenever", user: user2, building: Building.last)
booking3 = Booking.new( status: "unconfirmed", date: "whenever", user: user2, building: Building.first)

puts "Finished!"
