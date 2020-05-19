# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pet.destroy_all
Review.destroy_all
Shelter.destroy_all

shelter_1 = Shelter.create(name: "Pets Place",
  address: "341 Bonanza",
  city:  "Denver",
  state: "CO",
  zip: 80127)
shelter_2 = Shelter.create(name: "San Diego Humane Society", address: "5500 Gaines St", city: "San Diego", state: "CA", zip: "92110")
shelter_3 = Shelter.create(name: "La Costa Animal Hospital", address: "7668 El Camino Real #101", city: "Carlsbad", state: "CA", zip: "92009")
shelter_4 = Shelter.create(name: "DogSpot", address: "4151 Avenida Plaza Real", city: "Oceanside", state: "CA", zip: "92056")
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


pet_3 = Pet.create(image: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2017/09/chihuahua-names-1.jpg",
                  name: "Skip", description: "I am very energetic, I love to be around people!", approximate_age: "2", sex: "Male", shelter_id: shelter_1.id)
pet_4 = Pet.create(image: "https://www.thepaws.net/wp-content/uploads/2018/09/beagle-bloodhound-dog-mix-2.jpg",
                  name: "Yayla", description: "I am the calmest dog you will ever meet, I love belly rubs and lots of treats", approximate_age: "4", sex: "Female", shelter_id: shelter_3.id)
pet_5 = Pet.create(image: "https://www.dogster.com/wp-content/uploads/2018/12/german-shepard-dog-face.jpg", 
                  name: "Shadow", description: "I'm a German Sheperd and I love to play and go on walks!", approximate_age: "3", sex: "Male", shelter_id: shelter_3.id)
pet_6 = Pet.create(image: "https://i.pinimg.com/originals/16/f3/9e/16f39e58bede777ff5ad25e57521efb4.jpg",
                  name: "Max", description: "I am a 3 year old Rottweiler, super friendly and love to play!", approximate_age: "3", sex: "Male", shelter_id: shelter_2.id)
