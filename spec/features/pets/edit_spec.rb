require 'rails_helper'

describe "user updates a new pet" do
  describe "they click link from the  pet show page" do
    describe "they click update pet" do
      it "updates the pet information" do

shelter_1 = Shelter.create(name: "Pets Place",
                     address: "341 Bonanza",
                     city:  "Denver",
                     state: "CO",
                     zip: 80127)
pet_1 = Pet.create(name: "Mansy",
                     image: "forlorn_1.jpg",
                     approximate_age:  3,
                     sex: "Male",
                     description: "Very Cute Cat!",
                     shelter_id: shelter_1.id)

                 visit "/pets/#{pet_1.id}"
                 click_on "Update Pet"

                 fill_in :name, with: "Tamy"
                 fill_in :image,  with: "tamy.jpg"
                 fill_in :approximate_age,  with: 3
                 fill_in :description,  with: "extra Cute Cat!"
                 fill_in :sex,  with: "Female"
                 click_on "Update Pet"

                 expect(current_path).to eq("/pets/#{pet_1.id}")
                 expect(page).to have_content("Tamy")
                 # expect(page).to have_content("tamy.jpg")
                 expect(page).to have_content(3)
                 expect(page).to have_content("Female")
                 expect(page).to have_content("extra Cute Cat!")
                 expect(page).to have_content("Status: Adoptable")
      end
    end
  end
end
# As a visitor
# When I visit a Pet Show page
# Then I see a link to update that Pet "Update Pet"
# When I click the link
# I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
# - image
# - name
# - description
# - approximate age
# - sex
# When I click the button to submit the form "Update Pet"
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page where I see the Pet's updated information
