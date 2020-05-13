require 'rails_helper'

RSpec.describe "Update Review on Shelter show page", type: :feature do
  it "can update review for shelter" do
    shelter_1 = Shelter.create(name: "Pets Place",
                         address: "341 Bonanza",
                         city:  "Denver",
                         state: "CO",
                         zip: 80127)
    review_1 = shelter_1.reviews.create(title: "Found my best friend!",
                         rating: "5",
                         content: "The staff was very friendly and allowe dme to take my time meeting with any dog I thought was a godo fit. They even allowed and encouraged me to bring my other dog to meet one of the pups I was interested in. This flexibility helped me make sure the dog I met with was a good fit. I've found my new best friend!",
                         picture: "https://www.pedigreedatabase.com/uploads/Reliya/images/13592736_10208042346674904_51006761307976618_n-1.jpg",
                         shelter_id: shelter_1.id)
    visit "/shelters/#{shelter_1.id}"

    click_on "Update Review"

    fill_in :title, with: "Such a Great Place!"
    fill_in :content,  with: "Had a Great tme and found a great pup"
    fill_in :rating, with: "5"
    fill_in :picture,  with: "https://i.insider.com/5df126b679d7570ad2044f3e?width=1100&format=jpeg&auto=webp"
    click_on "Update Review"

    expect(page).to have_content(review_1.title)
    expect(page).to have_content(review_1.rating)
    expect(page).to have_content(review_1.content)
    expect(page).to have_css("img[src*='#{review_1.picture}']")
  end
end




# As a visitor,
# When I visit a shelter's show page
# I see a link to edit the shelter review next to each review.
# When I click on this link, I am taken to an edit shelter review path
# On this new page, I see a form that includes that review's pre populated data:
# - title
# - rating
# - content
# - image
# I can update any of these fields and submit the form.
# When the form is submitted, I should return to that shelter's show page
# And I can see my updated review
