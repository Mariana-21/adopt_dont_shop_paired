# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shelter_1 = Shelter.create(name: "Pets Place",
                     address: "341 Bonanza",
                     city:  "Denver",
                     state: "CO",
                     zip: 80127)
pet_1 = Pet.create(name: "Mansy",
                     image: "https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                     approximate_age:  3,
                     sex: "Male",
                     description: "Very Cute Cat!",
                     shelter_id: shelter_1.id)
pet_2 = Pet.create(name: "Lanny",
                     image: "https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                     approximate_age:  4,
                     sex: "Female",
                     description: "Super Very Cute Cat!",
                     shelter_id: shelter_1.id)
