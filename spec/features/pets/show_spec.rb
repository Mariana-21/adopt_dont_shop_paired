require 'rails_helper'

RSpec.describe "pets show page", type: :feature do
  it "can see all info for that pet id" do
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

    expect(page).to have_content(pet_1.name)
    # expect(page).to have_content(pet_1.image)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.description)

  end
end

#
# As a visitor
# When I visit '/pets/:id'
# Then I see the pet with that id including the pet's:
# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status
