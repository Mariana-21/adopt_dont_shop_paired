require 'rails_helper'

RSpec.describe "When a user adds a pet to their favorites" do
  it "displays a message" do
    shelter_1 = Shelter.create(name: "Pets Place", address: "341 Bonanza", city:  "Denver", state: "CO", zip: 80127)
    shelter_2 = Shelter.create(name: "San Diego Humane Society", address: "5500 Gaines St", city: "San Diego", state: "CA", zip: "92110")
    pet_2 = Pet.create( image: "https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                        name: "Lanny",
                        approximate_age:  4,
                        sex: "Female",
                        description: "Super Very Cute Cat!",
                        shelter_id: shelter_1.id)
    pet_3 = Pet.create( image: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2017/09/chihuahua-names-1.jpg",
                        name: "Skip", description: "I am very energetic, I love to be around people!", approximate_age: 2, sex: "Male", shelter_id: shelter_2.id)

    visit "/pets"

    within("#pet-#{pet_2.id}") do
      click_button "Add To Favorites"
    end
    expect(page).to have_content("You have added #{pet_2.name} to your favorites!")

    within("#pet-#{pet_3.id}") do
      click_button "Add To Favorites"
    end

    expect(page).to have_content("You have added #{pet_3.name} to your favorites!")
  end
end