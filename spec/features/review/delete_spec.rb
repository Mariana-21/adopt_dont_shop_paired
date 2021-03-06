require 'rails_helper'

RSpec.describe "Delete Review on Shelter show page", type: :feature do
  it "can Delete review for shelter" do
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

    expect(page).to have_content(review_1.title)
    expect(page).to have_content(review_1.rating)
    expect(page).to have_content(review_1.content)
    expect(page).to have_css("img[src*='#{review_1.picture}']")

    click_on "Delete Review"

    expect(page).to_not have_content(review_1.title)
    expect(page).to_not have_content(review_1.rating)
    expect(page).to_not have_content(review_1.content)
    expect(page).to_not have_css("img[src*='#{review_1.picture}']")

  end
end
