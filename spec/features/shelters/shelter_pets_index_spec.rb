require 'rails_helper'

RSpec.describe "Show Index of all pets in a shelter" do
    describe "will display all pet information for that shelter." do
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
                             description: "Very Cute Cat!",
                             shelter_id: shelter_1.id)
        pet_2 = Pet.create(name: "Lanny",
                             image: "https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                             approximate_age:  4,
                             sex: "Female",
                             description: "Super Very Cute Cat!",
                             shelter_id: shelter_1.id)
        visit  "/shelters/#{shelter_1.id}/pets"

        expect(page).to have_content(pet_1.name)
        expect(page).to have_content(pet_2.name)
        # expect(page).to have_content(pet_1.image)
        # expect(page).to have_content(pet_2.image)
        expect(page).to have_content(pet_1.approximate_age)
        expect(page).to have_content(pet_2.approximate_age)
        expect(page).to have_content(pet_1.sex)
        expect(page).to have_content(pet_2.sex)
        expect(page).to have_content(pet_1.description)
        expect(page).to have_content(pet_2.description)
        expect(page).to have_content("Pets Place")


      end
    end
end






# Then I see each Pet that can be adopted from that Shelter with that shelter_id including the Pet's:
# - image
# - name
# - approximate age
# - sex
