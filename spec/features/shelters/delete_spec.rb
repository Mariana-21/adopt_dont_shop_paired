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
  end
end







# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter
