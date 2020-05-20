require 'rails_helper'

RSpec.describe "Destroy an pet" do
  describe "When I visit a pet show page" do
    it "I can Delete a pet" do
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


      visit "/pets/#{pet_1.id}"

      expect(page).to have_content(pet_1.name)

      click_on("Delete Pet")
      expect(current_path).to eq("/pets")
      save_and_open_page
      expect(page).to_not have_content(pet_1.name)
      expect(page).to have_content(pet_2.name)
    end

    it "If a pet has an approved application on them, I can not delete that pet" do
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
      app_1 = Application.create(name: "John", address: "341 Bonanza", city: "Denver", state: "CO", zip: "80127", phone: "303", description: "great app")
      app_2 = Application.create(name: "John", address: "341 Bonanza", city: "Denver", state: "CO", zip: "80127", phone: "303", description: "great app")
      ApplicationPet.create(application_id: app_1.id, pet_id: pet_1.id)
      ApplicationPet.create(application_id: app_1.id, pet_id: pet_2.id)
      ApplicationPet.create(application_id: app_2.id, pet_id: pet_3.id)

      visit "/applications/#{app_1.id}"
      within("#pet-#{pet_1.id}") do
          click_on "Approve"
      end

      visit"/pets"

      within("#pet-#{pet_1.id}") do
        expect(page).to_not have_button("Delete Pet")
      end

      visit"/pets/#{pet_1.id}"

      expect(page).to_not have_button("Delete Pet")
    end
  end
end

# As a visitor
# If a pet has an approved application on them
# I can not delete that pet
# Either:
# - there is no button visible for me to delete the pet
# - if I click on the delete button, I see a flash message indicating that the pet can not be deleted.


# As a visitor
# When I visit a pet show page
# Then I see a link to delete the pet "Delete Pet"
# When I click the link
# Then a 'DELETE' request is sent to '/pets/:id',
# the pet is deleted,
# and I am redirected to the pet index page where I no longer see this pet
