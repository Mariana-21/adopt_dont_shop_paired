require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I have added pets to my favorites list" do
    describe "And I visit my favorites page ('/favorites')" do
      it "I see a link to remove all favorited pets" do 
        shelter_1 = Shelter.create(name: "Pets Place", address: "341 Bonanza", city:  "Denver", state: "CO", zip: 80127)
      shelter_2 = Shelter.create(name: "San Diego Humane Society", address: "5500 Gaines St", city: "San Diego", state: "CA", zip: "92110")
      pet_1 = Pet.create(name: "Mansy",
                      image: "https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      approximate_age:  3,
                      sex: "Male",
                      description: "Very Cute Cat!",
                      shelter_id: shelter_1.id)
      pet_2 = Pet.create( image: "https://images.pexels.com/photos/104827/cat-pet-animal-domestic-104827.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                          name: "Lanny",
                          approximate_age:  4,
                          sex: "Female",
                          description: "Super Very Cute Cat!",
                          shelter_id: shelter_1.id)
      pet_3 = Pet.create( image: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2017/09/chihuahua-names-1.jpg",
                          name: "Skip", description: "I am very energetic, I love to be around people!", approximate_age: 2, sex: "Male", shelter_id: shelter_2.id)

      visit "/pets/#{pet_1.id}"

      within("#pet-#{pet_1.id}") do
          click_button("Add to Favorites")
      end

      visit "/pets/#{pet_2.id}"
      within("#pet-#{pet_2.id}") do
          click_button("Add to Favorites")
      end

      visit"/pets/#{pet_3.id}"
      within("#pet-#{pet_3.id}") do
          click_button("Add to Favorites")
      end

      visit "/favorites" 

      click_link"Remove All Pets"

      expect(current_path).to eq("/favorites")
      expect(page).to have_content("You haven't favorited any pets. Go find a pet you love!") 
      expect(page).to_not have_link(pet_1.name) 
      expect(page).to_not have_link(pet_2.name) 
      expect(page).to_not have_link(pet_3.name)

      
      end
    end
  end
end



# When I click that link
# I'm redirected back to the favorites page
# I see the text saying that I have no favorited pets
# And the favorites indicator returns to 0