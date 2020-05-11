
require 'rails_helper'

RSpec.describe "Show Index of all pets" do
    it "will display all pet information." do
      shelter_1 = Shelter.create(name: "Pets Place",
                           address: "341 Bonanza",
                           city:  "Denver",
                           state: "CO",
                           zip: 80127)
      pet_1 = Pet.create(name: "Mansy",
                           image: "https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                           approximate_age:  3,
                           sex: "Male",
                           description: "Very cute Cat!",
                           shelter_id: shelter_1.id)


        visit '/pets'
        expect(page).to have_content(pet_1.name)
        expect(page).to have_xpath("//img[contains(@src, pet_1.image)]")
        expect(page).to have_content(pet_1.approximate_age)
        expect(page).to have_content(pet_1.sex)
        expect(page).to have_content(pet_1.description)
        expect(page).to have_content("Pets Place")
    end
  end
