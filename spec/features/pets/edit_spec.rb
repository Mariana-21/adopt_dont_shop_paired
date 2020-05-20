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

      it "If I try to update the form with incomplete information, I see a flash message indicating which field(s) I am missing" do

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
        expect(current_path).to eq("/pets/#{pet_1.id}/edit")


        fill_in :name, with: "Max"
        fill_in :image,  with: "https://i.pinimg.com/originals/16/f3/9e/16f39e58bede777ff5ad25e57521efb4.jpg"
        fill_in :approximate_age,  with: 4
        fill_in :description,  with: ""
        fill_in :sex,  with: "Male"
        click_on "Update Pet"


        expect(page).to have_content("Pet not created.")
      end
    end
  end
end
