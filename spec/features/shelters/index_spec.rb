require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters" do
    shelter_1 = Shelter.create(name: "Pets Place",
                         address: "341 Bonanza",
                         city:  "Denver",
                         state: "CO",
                         zip: 80127)
    shelter_2 = Shelter.create(name: "Puppy Pals",
                         address: "341 Pupper",
                         city:  "Littleton",
                         state: "AZ",
                         zip: 80210)

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)

    expect(page).to have_content(shelter_2.name)

  end
end
