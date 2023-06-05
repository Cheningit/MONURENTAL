# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "cleaning your db.....:)"
Building.destroy_all

puts "creating buildings...."


eiffel_tower = {address: "Dishoom", name: "Champ de Mars, 5 Av. Anatole France, 75007 Paris, France", beds: 5, price:100000, availability: "5/7/2023"}
taj_mahal = {address: "Dishoom", name: "Dharmapuri, Forest Colony, Tajganj, Agra, Uttar Pradesh 282001, India", beds: 5, price:10, availability: "5/8/2023"}
great_wall_of_china = {address: "Dishoom", name: "CHJC+Q4 Sanduhe Town, Huairou District, Beijing, China", beds: 5, price:90000, availability: "5/7/2023"}
statue_of_liberty = {address: "Dishoom", name: "New York, NY 10004", beds: 5, price:100000, availability: "5/7/2023"}
machu_pichu = {address: "Dishoom", name: "QGF3+F3 Aguas Calientes, Peru", beds: 5, price:100000, availability: "5/7/2023"}
sydney_opera_house = {address: "Dishoom", name: "Bennelong Point, Easy walk from Circular Quay Train Station, Sydney, AU 2000", beds: 5, price:100000, availability: "5/7/2023"}
pyramids_of_giza = {address: "Dishoom", name: "30 Lebanon St., MOHANDESEEN", beds: 5, price:100000, availability: "5/7/2023"}

[eiffel_tower, taj_mahal, great_wall_of_china, statue_of_liberty, machu_pichu, sydney_opera_house, pyramids_of_giza].each do |attributes|
  building = Building.create!(attributes)
  puts "Created #{building.name}"
end
puts "Finished!"
