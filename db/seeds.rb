# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

room1 = Room.create(
  "room_number": "Room 1",
  "room_type": "Luxury Suite",
  "room_desc": "Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis, necessitatibus.",
  "room_img": "https://res.cloudinary.com/dskl0qde4/image/upload/v1678996967/room-1_h37evv.jpg",
  "room_max_guests": 4,
  "room_size": 30,
  "room_price": 90.00,
  "beds": "1 King Bed"
)

room2 = Room.create(
  "room_number": "Room 2",
  "room_type": "Standard Deluxe",
  "room_desc": "Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis, necessitatibus.",
  "room_img": "https://res.cloudinary.com/dskl0qde4/image/upload/v1678989821/room-2_jjks91.jpg",
  "room_max_guests": 6,
  "room_size": 45,
  "room_price": 75.00,
  "beds": "2 Single Beds"
)

room3 = Room.create(
  "room_number": "Room 3",
  "room_type": "The Penthouse",
  "room_desc": "Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis, necessitatibus.",
  "room_img": "https://res.cloudinary.com/dskl0qde4/image/upload/v1678996973/room-3_es6gm9.jpg",
  "room_max_guests": 6,
  "room_size": 65,
  "room_price": 200.00,
  "beds": "2 King Beds"
)

room4 = Room.create(
  "room_number": "Room 4",
  "room_type": "Grand Suite Room",
  "room_desc": "Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis, necessitatibus.",
  "room_img": "https://res.cloudinary.com/dskl0qde4/image/upload/v1678996980/room-4_tt11ri.jpg",
  "room_max_guests": 4,
  "room_size": 70,
  "room_price": 80.00,
  "beds": "1 King Bed"
)

room5 = Room.create(
  "room_number": "Room 5",
  "room_type": "Junior Suite Room",
  "room_desc": "Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis, necessitatibus.",
  "room_img": "https://res.cloudinary.com/dskl0qde4/image/upload/v1678996987/room-5_dzzetr.jpg",
  "room_max_guests": 3,
  "room_size": 31,
  "room_price": 69.00,
  "beds": "1 Double Bed"
)