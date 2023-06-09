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

eiffel_tower = {address: "France, Paris, Champ de Mars, 5 Av. Anatole France, 75007 ", name: "eiffel tower", beds: 5, price:100000, availability: "5/7/2023", description:"It was at the 1889 Exposition Universelle, the date that marked the 100th anniversary of the French Revolution, that a great competition was launched in the Journal Officiel. The first digging work started on the 26th January 1887. On the 31st March 1889, the Tower had been finished in record time – 2 years, 2 months and 5 days – and was established as a veritable technical feat", user: user1}
taj_mahal = {address: "India, Dharmapuri, Tajganj, Agra, Uttar Pradesh 282001,", name: "taj mahal", beds: 750, price:9506500, availability: "5/8/2023", description: "The Taj Mahal was built by the Mughal emperor Shah Jahān (reigned 1628–58) to immortalize his wife Mumtaz Mahal (“Chosen One of the Palace”), who died in childbirth in 1631, having been the emperor’s inseparable companion since their marriage in 1612. India’s most famous and widely recognized building, it is situated in the eastern part of the city on the southern (right) bank of the Yamuna (Jumna) River.", user: user4}
great_wall_of_china = {address: "Chine, Beijing, Sanduhe Town, Huairou District,", name: "great wall of china", beds: 1000000, price:90000, availability: "10/7/2023", description: "The Great Wall of China was built over centuries by China’s emperors to protect their territory. Today, it stretches for thousands of miles along China’s historic northern border. For millennia, Chinese leaders instituted wall-building projects to protect the land from northern, nomadic invaders. One surviving section of such an ancient wall, in the Shandong province, is made of hard-packed soil called “rammed earth” and is estimated to be 2,500 years old. For centuries during the Warring States Period, before China was unified into one nation, such walls defended the borders.",user: user2}
statue_of_liberty = {address: "SUA, New York, NY 10004 Liberty Island York Harbor", name: "statue of liberty", beds: 50, price:100000, availability: "5/7/2023", description: "She is an icon, a national treasure, and one of the most recognizable figures in the world. Each year millions who cherish her ideals make the journey to experience her history and grandeur in person. She is the Statue of Liberty, a symbol of freedom, inspiration, and hope.", user: user1}
machu_pichu = {address: " Peru  Aguas Calientes, Northwest of Cuzco", name: "machu pichu", beds: 30, price:100000, availability: "20/7/2023", description: "Scholars are still striving to uncover clues to the mysteries hidden here high in the eastern slopes of the Andes, covered with tropical forests of the upper Amazon Basin. Machu Picchu appears to lie at the center of a network of related sites and trails—and many landmarks both man-made and mountainous appear to align with astronomical events like the solstice sunset. The Inca had no written language, so they left no record of why they built the site or how they used it before it was abandoned in the early 16th century.", user: user2}
sydney_opera_house = {address: "Bennelong Point, Circular Quay Train Station, Sydney, AU 2000", name: "sydney opera house", beds: 50, price:1000950, availability: "6/7/2023", description: "The Sydney Opera House is situated on Bennelong Point (originally called Cattle Point), a promontory on the south side of the harbour just east of the Sydney Harbour Bridge. It was named for Bennelong, one of two Aboriginal people (the other man was named Colebee) who served as liaisons between Australia’s first British settlers and the local population. ", user: user3}
pyramids_of_giza = {address: "Egipt, MOHANDESEEN, 30 Lebanon St., ", name: "pyramids of giza", beds: 1000, price:100000, availability: "9/7/2023", description: "Pyramids of Giza, Arabic Ahrāmāt Al-Jīzah, Giza also spelled Gizeh, three 4th-dynasty (c. 2575–c. 2465 bce) pyramids erected on a rocky plateau on the west bank of the Nile River near Al-Jīzah (Giza) in northern Egypt. In ancient times they were included among the Seven Wonders of the World.", user: user1}
colosseum = {address: "Italy, Rome, Piazza del Colosseo, 1, 00184 ", name: "colosseum", beds: 300, price:569000, availability: "9/7/2023", description: "Colosseum, also called Flavian Amphitheatre, giant amphitheatre built in Rome under the Flavian emperors. Construction of the Colosseum was begun sometime between 70 and 72 ce during the reign of Vespasian. It is located just east of the Palatine Hill, on the grounds of what was Nero’s Golden House. ", user: user1}

# cloudinary section
file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686058044/Tour_Eiffel_Wikimedia_Commons__28cropped_29_m76qge.jpg")
building = Building.new(eiffel_tower)
building.photos.attach(io: file, filename: "eiffel_tower.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304144/Eiffel-tower-fall-foliage-768x1024_f1drba.jpg")
building = Building.new(eiffel_tower)
building.photos.attach(io: file, filename: "eiffel_tower.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304184/Square-Rapp_a05zyz.jpg")
building = Building.new(eiffel_tower)
building.photos.attach(io: file, filename: "eiffel_tower.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304111/untitled-001_Olivier_20Costier_800px_hwpvyi.jpg")
building = Building.new(eiffel_tower)
building.photos.attach(io: file, filename: "eiffel_tower.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304122/_5110031c-01_gerardtrang_800px_dueof5.jpg")
building = Building.new(eiffel_tower)
building.photos.attach(io: file, filename: "eiffel_tower.jpg", content_type: "image/jpg")
building.save!


# ================================================================================================================

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686058113/Taj_Mahal_2C_Agra_2C_India_edit3_npr4rg.jpg")
building = Building.new(taj_mahal)
building.photos.attach(io: file, filename: "taj_mahal.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304214/pexels-photo-3361480_juvlrq.jpg")
building = Building.new(taj_mahal)
building.photos.attach(io: file, filename: "taj_mahal.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304229/pexels-photo-2387871_htod1j.jpg")
building = Building.new(taj_mahal)
building.photos.attach(io: file, filename: "taj_mahal.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304243/pexels-photo-5458393_bk6zkz.jpg")
building = Building.new(taj_mahal)
building.photos.attach(io: file, filename: "taj_mahal.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304333/pexels-photo-2697288_pskqcp.jpg")
building = Building.new(taj_mahal)
building.photos.attach(io: file, filename: "taj_mahal.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304346/pexels-photo-7263939_yjdf7q.jpg")
building = Building.new(taj_mahal)
building.photos.attach(io: file, filename: "taj_mahal.jpg", content_type: "image/jpg")
building.save!

# ================================================================================================================

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686058391/Great-Wall-Of-China-1600x900_umlckc.jpg")
building = Building.new(great_wall_of_china)
building.photos.attach(io: file, filename: "great_wall_of_china.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304536/iu_xpvswe.jpg")
building = Building.new(great_wall_of_china)
building.photos.attach(io: file, filename: "great_wall_of_china.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304583/iu_kaxp9w.jpg")
building = Building.new(great_wall_of_china)
building.photos.attach(io: file, filename: "great_wall_of_china.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304594/iu_xgpvgi.jpg")
building = Building.new(great_wall_of_china)
building.photos.attach(io: file, filename: "great_wall_of_china.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304607/476007_vv8yr9.jpg")
building = Building.new(great_wall_of_china)
building.photos.attach(io: file, filename: "great_wall_of_china.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304631/iu_giatib.jpg")
building = Building.new(great_wall_of_china)
building.photos.attach(io: file, filename: "great_wall_of_china.jpg", content_type: "image/jpg")
building.save!

# ================================================================================================================

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686058199/Lady_Liberty_under_a_blue_sky__28cropped_29_o13gyk.jpg")
building = Building.new(statue_of_liberty)
building.photos.attach(io: file, filename: "statue_of_liberty.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304659/iu_htclhk.jpg")
building = Building.new(statue_of_liberty)
building.photos.attach(io: file, filename: "statue_of_liberty.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304676/iu_zx5a78.jpg")
building = Building.new(statue_of_liberty)
building.photos.attach(io: file, filename: "statue_of_liberty.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304705/iu_fddjqs.jpg")
building = Building.new(statue_of_liberty)
building.photos.attach(io: file, filename: "statue_of_liberty.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304720/iu_uizzch.jpg")
building = Building.new(statue_of_liberty)
building.photos.attach(io: file, filename: "statue_of_liberty.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304733/iu_nef6fj.jpg")
building = Building.new(statue_of_liberty)
building.photos.attach(io: file, filename: "statue_of_liberty.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304756/iu_rmtmhz.jpg")
building = Building.new(statue_of_liberty)
building.photos.attach(io: file, filename: "statue_of_liberty.jpg", content_type: "image/jpg")
building.save!


# ================================================================================================================

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686058219/Machu_Picchu_2C_Peru_qkn1vy.jpg")
building = Building.new(machu_pichu)
building.photos.attach(io: file, filename: "machu_pichu.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304809/934e6472-80de-479e-b69c-578ab07b6b7f_qqvnqs.jpg")
building = Building.new(machu_pichu)
building.photos.attach(io: file, filename: "machu_pichu.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304826/AdobeStock_64916665-scaled_sia5p7.jpg")
building = Building.new(machu_pichu)
building.photos.attach(io: file, filename: "machu_pichu.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304849/9865e70471a7267f4297205cfd187839_odfsze.jpg")
building = Building.new(machu_pichu)
building.photos.attach(io: file, filename: "machu_pichu.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304849/9865e70471a7267f4297205cfd187839_odfsze.jpg")
building = Building.new(machu_pichu)
building.photos.attach(io: file, filename: "machu_pichu.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304857/299834_xywvow.jpg")
building = Building.new(machu_pichu)
building.photos.attach(io: file, filename: "machu_pichu.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304867/ed08ad71e2cd56e396e89e5ebcd2b31c_bcgj87.jpg")
building = Building.new(machu_pichu)
building.photos.attach(io: file, filename: "machu_pichu.jpg", content_type: "image/jpg")
building.save!

# ================================================================================================================

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686058365/Kheops-Pyramid_f53vtl.jpg")
building = Building.new(pyramids_of_giza)
building.photos.attach(io: file, filename: "pyramids_of_giza.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686305022/pyramid-of-giza-1_etay0o.jpg")
building = Building.new(pyramids_of_giza)
building.photos.attach(io: file, filename: "pyramids_of_giza.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686305038/e6a1c74279d274490773019422533710_upounh.jpg")
building = Building.new(pyramids_of_giza)
building.photos.attach(io: file, filename: "pyramids_of_giza.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686305048/giza-pyramids-3_dite0a.jpg")
building = Building.new(pyramids_of_giza)
building.photos.attach(io: file, filename: "pyramids_of_giza.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686305068/1037478-full-size-giza-pyramids-wallpaper-1920x1080-for-mobile_udctb6.jpg")
building = Building.new(pyramids_of_giza)
building.photos.attach(io: file, filename: "pyramids_of_giza.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686305114/20090204-egypt-1038_hr3kfl.jpg")
building = Building.new(pyramids_of_giza)
building.photos.attach(io: file, filename: "pyramids_of_giza.jpg", content_type: "image/jpg")
building.save!
# ================================================================================================================

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686058251/Sydney_Australia.__2821339175489_29_viojab.jpg")
building = Building.new(sydney_opera_house)
building.photos.attach(io: file, filename: "sydney_opera_house.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304996/Lighting_the_Sails_Sydney_Opera_House_credit_Daniel_Boud_010_mwzff0.jpg")
building = Building.new(sydney_opera_house)
building.photos.attach(io: file, filename: "sydney_opera_house.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304976/sydney-opera-house-australia_lncauu.jpg")
building = Building.new(sydney_opera_house)
building.photos.attach(io: file, filename: "sydney_opera_house.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304960/18486-sydney-opera-house-1920x1080-world-wallpaper_qufxcs.jpg")
building = Building.new(sydney_opera_house)
building.photos.attach(io: file, filename: "sydney_opera_house.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304953/iu_bzlzp9.jpg")
building = Building.new(sydney_opera_house)
building.photos.attach(io: file, filename: "sydney_opera_house.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686304933/52341_house-opera-wiezowce_cq3aat.jpg")
building = Building.new(sydney_opera_house)
building.photos.attach(io: file, filename: "sydney_opera_house.jpg", content_type: "image/jpg")
building.save!

# ================================================================================================================

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686231665/pexels-mark-neal-2225439_qtfezt.jpg")
building = Building.new(colosseum)
building.photos.attach(io: file, filename: "sydney_opera_house.jpg", content_type: "image/jpg")
building.save!

file = URI.open("https://res.cloudinary.com/dyb1vce9d/image/upload/v1686305208/Colosseum-Inside-Photo_tomfkr.jpg")
building = Building.new(colosseum)
building.photos.attach(io: file, filename: "sydney_opera_house.jpg", content_type: "image/jpg")
building.save!



# ================================================================================================================

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
