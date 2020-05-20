require 'rails_helper'

RSpec.describe "shelter show page", type: :feature do
  it "can see all shelter info" do
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

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
    expect(page).to have_content(shelter_1.total_pets)


  end
end
