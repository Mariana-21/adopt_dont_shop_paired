require 'rails_helper'

describe "user creates a new shelter" do
  describe "they link from the shelters index" do
    describe "they fill in a location data and" do
      it "update  a current shelter" do
        shelter_1 = Shelter.create(name: "Pets Place",
                             address: "341 Bonanza",
                             city:  "Denver",
                             state: "CO",
                             zip: 80127)
        visit "/shelters/#{shelter_1.id}"
        click_on "Update Shelter"

        fill_in "shelter[name]", with: "Pupper Town"
        fill_in "shelter[address]",  with: "Willowleaf"
        fill_in "shelter[city]",  with: "Littleton"
        fill_in "shelter[state]",  with: "CO"
        fill_in "shelter[zip]",  with: 80122
        click_on "Update Shelter"

        expect(page).to have_content("Pupper Town")
        expect(page).to have_content("Willowleaf")
        expect(page).to have_content("Littleton")
        expect(page).to have_content("CO")
        expect(page).to have_content(80122)

      end
    end
  end
end
