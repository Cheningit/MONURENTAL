# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "cleaning your db...."
# User.destroy_all

puts "creating users......"

# only run once, no need to delete them
user1 = User.new
user1.email = 'russell@email.com'
user1.password = 'taawktljasktlw4aaglj'
user1.save!

user2 = User.new
user2.email = 'tony@example.com'
user2.password = 'taawktljasktlw4aaglj'
user2.save!

# user3 = User.new
# user3.email = 'victor@homepage.com'
# user3.password = '#$taawktljasktlw4aaglj'
# user3.save!

# user4 = User.new
# user4.email = 'clement@england.com'
# user4.password = '#$taawktljasktlw4aaglj'
# user4.save!


puts "cleaning your db.....:)"
Building.destroy_all

puts "creating buildings...."


# availability has to be an actual date

eiffel_tower = {address: "Champ de Mars, 5 Av. Anatole France, 75007 Paris, France", name: "eiffel tower", beds: 5, price:100000, availability: "5/7/2023", user: user1}
taj_mahal = {address: "Dharmapuri, Forest Colony, Tajganj, Agra, Uttar Pradesh 282001, India", name: "taj mahal", beds: 5, price:10, availability: "5/8/2023", user: user2}
great_wall_of_china = {address: "CHJC+Q4 Sanduhe Town, Huairou District, Beijing, China", name: "great wall of china", beds: 5, price:90000, availability: "10/7/2023", user: user2}
statue_of_liberty = {address: "New York, NY 10004", name: "statue of liberty", beds: 5, price:100000, availability: "5/7/2023", user: user1}
machu_pichu = {address: "QGF3+F3 Aguas Calientes, Peru", name: "machu pichu", beds: 5, price:100000, availability: "20/7/2023", user: user2}
sydney_opera_house = {address: "Bennelong Point, Easy walk from Circular Quay Train Station, Sydney, AU 2000", name: "sydney opera house", beds: 5, price:100000, availability: "6/7/2023", user: user1}
pyramids_of_giza = {address: "30 Lebanon St., MOHANDESEEN", name: "pyramids of giza", beds: 5, price:100000, availability: "9/7/2023", user: user1}

[eiffel_tower, taj_mahal, great_wall_of_china, statue_of_liberty, machu_pichu, sydney_opera_house, pyramids_of_giza].each do |attributes|
  building = Building.create!(attributes)
  puts "Created #{building.name}"
end
puts "Finished!"
