require 'rails_helper'

describe "user creates a new pet" do
  describe "they link from the shelter pets index" do
    describe "they click create pet" do
      it "creates a new pet for that shelter" do

        shelter_1 = Shelter.create(name: "Pets Place",
                             address: "341 Bonanza",
                             city:  "Denver",
                             state: "CO",
                             zip: 80127)
        visit  "/shelters/#{shelter_1.id}/pets"
        click_on "Create Pet"
        expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")


        fill_in :name, with: "Tory"
        fill_in :image,  with: "tory.jpg"
        fill_in :approximate_age,  with: 5
        fill_in :description,  with: "Very Cute Cat!"
        fill_in :sex,  with: "Female"
        click_on "Create Pet"

       expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
       expect(page).to have_content("Tory")
       # expect(page).to have_content("tory.jpg")
       expect(page).to have_content(5)
       expect(page).to have_content("Female")
       expect(page).to have_content("Very Cute Cat!")
       expect(page).to have_content("Status: Adoptable")

      end
    end
  end
end

# As a visitor
# When I visit a Shelter Pets Index page
# Then I see a link to add a new adoptable pet for that shelter "Create Pet"
# When I click the link
# I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
# When I fill in the form with the pet's:
# - image
# - name
# - description
# - approximate age
# - sex ('female' or 'male')
# And I click the button "Create Pet"
# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed
