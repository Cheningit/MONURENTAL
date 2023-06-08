# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
require "date"

puts "cleaning your db.....:)"
Building.destroy_all

puts "cleaning your db...."
User.destroy_all

# only run once, no need to delete them
puts "creating users......"
user1 = User.new
user1.email = 'russell@email.com'
user1.password = 'taawktljasktlw4aaglj'
user1.first_name = "Russel"
user1.last_name = "Smith"
user1.save!

# user1 = User.new(email:'russell@email.com', password:'taawktljasktlw4aaglj')

user2 = User.new
user2.email = 'tony@example.com'
user2.password = 'taawktljasktlw4aaglj'
user2.first_name = "Tony"
user2.last_name = "Chen"

user2.save!

user3 = User.new
user3.email = 'victor@issominted.com'
user3.password = '#$taawktljasktlw4aaglj'
user3.first_name = "Victor"
user3.last_name = "Isopescu"
user3.save!

user4 = User.new
user4.email = 'clement@england.com'
user4.password = '#$taawktljasktlw4aaglj'
user4.first_name = "Clement"
user4.last_name = "Carr"
user4.save!


puts "creating buildings...."


# availability has to be an actual date

eiffel_tower = {address: "France, Paris, Champ de Mars, 5 Av. Anatole France, 75007 ", name: "eiffel tower", beds: 5, price:100000, availability: "5/7/2023", user: user1}
taj_mahal = {address: "India, Dharmapuri, Tajganj, Agra, Uttar Pradesh 282001,", name: "taj mahal", beds: 750, price:9506500, availability: "5/8/2023", user: user4}
great_wall_of_china = {address: "Chine, Beijing, Sanduhe Town, Huairou District,", name: "great wall of china", beds: 1000000, price:90000, availability: "10/7/2023", user: user2}
statue_of_liberty = {address: "SUA, New York, NY 10004 Liberty Island York Harbor", name: "statue of liberty", beds: 50, price:100000, availability: "5/7/2023", user: user1}
machu_pichu = {address: " Peru  Aguas Calientes, Northwest of Cuzco", name: "machu pichu", beds: 30, price:100000, availability: "20/7/2023", user: user2}
sydney_opera_house = {address: "Bennelong Point, Circular Quay Train Station, Sydney, AU 2000", name: "sydney opera house", beds: 50, price:1000950, availability: "6/7/2023", user: user3}
pyramids_of_giza = {address: "Egipt, MOHANDESEEN, 30 Lebanon St., ", name: "pyramids of giza", beds: 1000, price:100000, availability: "9/7/2023", user: user1}
colosseum = {address: "Italy, Rome, Piazza del Colosseo, 1, 00184 ", name: "colosseum", beds: 300, price:569000, availability: "9/7/2023", user: user1}

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

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686058365/Kheops-Pyramid_f53vtl.jpg")
building = Building.new(pyramids_of_giza)
building.photos.attach(io: file, filename: "pyramids_of_giza.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686058251/Sydney_Australia.__2821339175489_29_viojab.jpg")
building = Building.new(sydney_opera_house)
building.photos.attach(io: file, filename: "sydney_opera_house.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686231665/pexels-mark-neal-2225439_qtfezt.jpg")
building = Building.new(colosseum)
building.photos.attach(io: file, filename: "sydney_opera_house.jpg", content_type: "image/jpg")
building.save!

puts "cleaning your booking db.....:)"
Booking.destroy_all

puts "Creating booking"
booking1 = Booking.new( status: "unconfirmed", date: "TBC", user: user3, start_date: Date.new(2024, 7, 7), end_date: Date.new(2024, 7, 8), building: Building.first)
booking1.total_price = ((booking1.end_date - booking1.start_date) * booking1.building.price).to_i
booking1.save!
booking2 = Booking.new( status: "unconfirmed", date: "TBC", user: user2, start_date: Date.new(2024, 7, 7), end_date: Date.new(2024, 7, 17), building: Building.last)
booking2.total_price = ((booking2.end_date - booking2.start_date) * booking2.building.price).to_i
booking2.save!
booking3 = Booking.new( status: "unconfirmed", date: "TBC", user: user2, start_date: Date.new(2024, 7, 7), end_date: Date.new(2024, 7, 10),building: Building.first)
booking3.total_price = ((booking3.end_date - booking3.start_date) * booking3.building.price).to_i
booking3.save!
puts "Finished!"
