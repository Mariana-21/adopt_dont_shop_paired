require 'rails_helper'

describe "user creates a new shelter" do
  describe "they link from the shelters index" do
    describe "they fill in a location data and" do
      it "creates a new shelter" do
        visit '/shelters'
        click_link "New Shelter"

        # expect('/shelters').to eq('/shelters/new')

        fill_in "shelter[name]", with: "Pet Place"
        fill_in "shelter[address]",  with: "Bonanza"
        fill_in "shelter[city]",  with: "Denver"
        fill_in "shelter[state]",  with: "CO"
        fill_in "shelter[zip]",  with: 80127
        click_on "Create Shelter"

        expect(page).to have_content("Pet Place")
      end
      it "fails to make shelter and explains why" do
        visit '/shelters'
        click_link "New Shelter"

        # expect('/shelters').to eq('/shelters/new')

        fill_in "shelter[name]", with: ""
        fill_in "shelter[address]",  with: "Bonanza"
        fill_in "shelter[city]",  with: "Denver"
        fill_in "shelter[state]",  with: "CO"
        fill_in "shelter[zip]",  with: 80127
        click_on "Create Shelter"

        expect(page).to have_content("Shelter not submitted. Missing one or more of the following fields: name.")
      end
    end
  end
end
