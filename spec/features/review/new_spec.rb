require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit a shelter show page" do 
    it "I can write a new review for that shelter" do 
      shelter_1 = Shelter.create(name: "Pets Place", address: "341 Bonanza", city:  "Denver", state: "CO", zip: "80127")
      shelter_2 = Shelter.create(name: "La Costa Animal Hospital", address: "7668 El Camino Real #101", city: "Carlsbad", state: "CA", zip: "92009")

      visit "/shelters/#{shelter_2.id}"

      click_link("Write a Review")

      expect(current_path).to eq("/shelters/#{shelter_2.id}/reviews/new")

      # expect(page).to have_field("Title")
      # expect(page).to have_field("Rating")
      # expect(page).to have_field("Content")
      # expect(page).to have_field("Picture URL (Optional)")

      fill_in "Title", with: "Found my best friend!"
      fill_in "Rating", with: "5"
      fill_in "Content", with: "The staff was very friendly and allowed me to take my time meeting with any dog I thought was a good fit. They even allowed and encouraged me to bring my other dog to meet one of the pups I was interested in. This flexibility helped me make sure the dog I met with was a good fit. I've found my new best friend!"
      fill_in "Picture URL (Optional)", with: "https://www.pedigreedatabase.com/uploads/Reliya/images/13592736_10208042346674904_51006761307976618_n-1.jpg"
      click_button("Submit Review")

      expect(current_path).to eq("/shelters/#{shelter_2.id}")

      expect(page).to have_content("Found my best friend!")
      expect(page).to have_content("5")
      expect(page).to have_content("The staff was very friendly and allowed me to take my time meeting with any dog I thought was a good fit. They even allowed and encouraged me to bring my other dog to meet one of the pups I was interested in. This flexibility helped me make sure the dog I met with was a good fit. I've found my new best friend!")
      expect(page).to have_css("img[src*='https://www.pedigreedatabase.com/uploads/Reliya/images/13592736_10208042346674904_51006761307976618_n-1.jpg']")
    end

    it "Cannot create review without a title, rating, and/or content" do
      shelter_2 = Shelter.create(name: "La Costa Animal Hospital", address: "7668 El Camino Real #101", city: "Carlsbad", state: "CA", zip: "92009")

      visit "/shelters/#{shelter_2.id}"

      click_link("Write a Review")
      expect(current_path).to eq("/shelters/#{shelter_2.id}/reviews/new")

      click_button("Submit Review")

      expect(page).to have_content("Review not submitted. Missing one or more of the following fields: Title, Rating or Additonal Information.")
      expect(page).to have_button("Submit Review")
    end
  end
end


# As a visitor,
# When I visit a shelter's show page
# I see a link to add a new review for this shelter.
# When I click on this link, I am taken to a new review path
# On this new page, I see a form where I must enter:
# - title
# - rating
# - content
# I also see a field where I can enter an optional image (web address)
# When the form is submitted, I should return to that shelter's show page
# and I can see my new review