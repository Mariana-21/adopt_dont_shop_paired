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

      click_button "Delete Pet"

      expect(current_path).to eq("/pets")
      expect(page).to_not have_content("Mansy")
      expect(page).to have_content(pet_2.name)
    end
  end
end


# As a visitor
# When I visit a pet show page
# Then I see a link to delete the pet "Delete Pet"
# When I click the link
# Then a 'DELETE' request is sent to '/pets/:id',
# the pet is deleted,
# and I am redirected to the pet index page where I no longer see this pet
