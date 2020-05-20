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

      it "If I try to submit the form with incomplete information, I see a flash message indicating which field(s) I am missing" do

        shelter_1 = Shelter.create(name: "Pets Place",
                             address: "341 Bonanza",
                             city:  "Denver",
                             state: "CO",
                             zip: 80127)
        visit  "/shelters/#{shelter_1.id}/pets"
        click_on "Create Pet"
        expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")


        fill_in :name, with: "Max"
        fill_in :image,  with: "https://i.pinimg.com/originals/16/f3/9e/16f39e58bede777ff5ad25e57521efb4.jpg"
        fill_in :approximate_age,  with: 4
        # fill_in :description,  with: "Very Cute Cat!"
        fill_in :sex,  with: "Male"
        click_on "Create Pet"


        expect(page).to have_content("Pet not created.")
      #  expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
      #  expect(page).to have_content("Max")
      #  # expect(page).to have_content("tory.jpg")
      #  expect(page).to have_content(4)
      #  expect(page).to have_content("Male")
      # #  expect(page).to have_content("Very Cute Cat!")
      #  expect(page).to have_content("Status: Adoptable")
      end
    end
  end
end
