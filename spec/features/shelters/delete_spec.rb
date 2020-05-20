require 'rails_helper'

RSpec.describe "Destroy an Shelter" do
  describe "When I visit an shelters show page" do
    it "I can Delete a shelter" do
    shelter_1 = Shelter.create(name: "Pets Place",
                         address: "341 Bonanza",
                         city:  "Denver",
                         state: "CO",
                         zip: 80127)
    shelter_2 = Shelter.create(name: "Puppy Pals",
                        address: "341 Pupper",
                        city:  "Littleton",
                        state: "AZ",
                        zip: 80210)

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_content(shelter_1.name)

      click_button "Delete Shelter"

      expect(current_path).to eq("/shelters")
      expect(page).to_not have_content("Pets Place")
      expect(page).to have_content(shelter_2.name)
    end
    it "I can Delete a shelter with pets" do
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
      visit "/shelters/#{shelter_1.id}"
      click_on "Delete Shelter"
      expect(current_path).to eq("/shelters")
      expect(page).to_not have_content(shelter_1.name)

    end
  end
end







# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter
