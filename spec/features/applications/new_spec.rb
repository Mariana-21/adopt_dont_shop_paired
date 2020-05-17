require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I have added apet to my favorites list" do
    it "I can use a link to adopt my favorited pets" do
      shelter_1 = Shelter.create(name: "Pets Place", address: "341 Bonanza", city:  "Denver", state: "CO", zip: 80127)
      shelter_2 = Shelter.create(name: "San Diego Humane Society", address: "5500 Gaines St", city: "San Diego", state: "CA", zip: "92110")
      pet_1 = Pet.create(name: "Mansy",
                      image: "https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      approximate_age:  3,
                      sex: "Male",
                      description: "Very Cute Cat!",
                      shelter_id: shelter_1.id)
      pet_2 = Pet.create( image: "https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                        name: "Lanny",
                        approximate_age:  4,
                        sex: "Female",
                        description: "Super Very Cute Cat!",
                        shelter_id: shelter_1.id)
      pet_3 = Pet.create( image: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2017/09/chihuahua-names-1.jpg",
                        name: "Skip", description: "I am very energetic, I love to be around people!", approximate_age: 2, sex: "Male", shelter_id: shelter_2.id)
      visit "/pets/#{pet_1.id}"
        click_on("Add to Favorites")
      visit "/pets/#{pet_2.id}"
        click_on("Add to Favorites")
      visit"/pets/#{pet_3.id}"
        click_on("Add to Favorites")
      visit "/favorites"
      click_on("Adopt a Pet")
      expect(current_path).to eq("/applications/new")
      within("#pet-#{pet_1.id}") do
          check("adoptable_pet[]")
      end
      within("#pet-#{pet_2.id}") do
          check("adoptable_pet[]")
      end
      within("#pet-#{pet_3.id}") do
          check("adoptable_pet[]")
      end
      fill_in :name, with: "John"
      fill_in :address, with: "341 Bonanza"
      fill_in :city, with: "Denver"
      fill_in :state, with: "CO"
      fill_in :zip, with: "80127"
      fill_in :phone, with: "111-111-1111"
      fill_in :description, with: "I want this pet"
      click_on("Submit")

      expect(current_path).to eq("/favorites")
      # expect(page).to have_content("Your Application has been submitted for these pets!")
      # within("adoptable") do
      # expect(page).to_not have_content(pet_1.name)
      # expect(page).to_not have_content(pet_2.name)
      # expect(page).to_not have_content(pet_3.name)
      # end
    end
    it "it will fail to complete form with out proper information" do
      shelter_1 = Shelter.create(name: "Pets Place", address: "341 Bonanza", city:  "Denver", state: "CO", zip: 80127)
      shelter_2 = Shelter.create(name: "San Diego Humane Society", address: "5500 Gaines St", city: "San Diego", state: "CA", zip: "92110")
      pet_1 = Pet.create(name: "Mansy",
                      image: "https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      approximate_age:  3,
                      sex: "Male",
                      description: "Very Cute Cat!",
                      shelter_id: shelter_1.id)
      pet_2 = Pet.create( image: "https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                        name: "Lanny",
                        approximate_age:  4,
                        sex: "Female",
                        description: "Super Very Cute Cat!",
                        shelter_id: shelter_1.id)
      pet_3 = Pet.create( image: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2017/09/chihuahua-names-1.jpg",
                        name: "Skip", description: "I am very energetic, I love to be around people!", approximate_age: 2, sex: "Male", shelter_id: shelter_2.id)
      visit "/pets/#{pet_1.id}"
        click_on("Add to Favorites")
      visit "/pets/#{pet_2.id}"
        click_on("Add to Favorites")
      visit"/pets/#{pet_3.id}"
        click_on("Add to Favorites")
      visit "/favorites"
      click_on("Adopt a Pet")
      expect(current_path).to eq("/applications/new")
      within("#pet-#{pet_1.id}") do
          check("adoptable_pet[]")
      end
      click_on("Submit")
      expect(page).to have_content("Application not submitted. Missing one or more of the following fields: Name, Address, City, State, Zip, Phone or Description.")
    end
    end
  end
