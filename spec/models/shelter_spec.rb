require "rails_helper"

describe Shelter, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:address)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zip)}
  end
end
RSpec.describe "deleting shelter show page", type: :feature do
  it "I can't use a link to delete an shelter if it has approved pets" do
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
    app_1 = Application.create(name: "John", address: "341 Bonanza", city: "Denver", state: "CO", zip: "80127", phone: "303", description: "great app")
    app_2 = Application.create(name: "John", address: "341 Bonanza", city: "Denver", state: "CO", zip: "80127", phone: "303", description: "great app")
    review_1 = shelter_1.reviews.create(title: "Found my best friend!",
                                    rating: "5",
                                    content: "The staff was very friendly and allowe dme to take my time meeting with any dog I thought was a godo fit. They even allowed and encouraged me to bring my other dog to meet one of the pups I was interested in. This flexibility helped me make sure the dog I met with was a good fit. I've found my new best friend!",
                                    picture: "https://www.pedigreedatabase.com/uploads/Reliya/images/13592736_10208042346674904_51006761307976618_n-1.jpg",
                                    shelter_id: shelter_1.id)
    review_2 = shelter_1.reviews.create(title: "All animals seemed very happy",
                                    rating: "4",
                                    content: "All animals seemed very happy and well taken care of. The kennels/cages were clean and each had a comfortable looking bed and a full water dish. Upon arriving I immediately noticed several volunteers and staff walking dogs or playing with them in the play yards.",
                                    picture: "",
                                    shelter_id: shelter_1.id)
    ApplicationPet.create(application_id: app_1.id, pet_id: pet_1.id)
    ApplicationPet.create(application_id: app_1.id, pet_id: pet_2.id)
    ApplicationPet.create(application_id: app_2.id, pet_id: pet_3.id)

    visit "/applications/#{app_1.id}"
    within("#pet-#{pet_1.id}") do
        click_on "Approve"
    end

    visit "/shelters/#{shelter_1.id}"
    expect(page).to_not have_content("Delete Shelter")
  end
  it "it can display statistics", type: :feature do
    shelter_1 = Shelter.create(name: "Pets Place", address: "341 Bonanza", city:  "Denver", state: "CO", zip: "80127")
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
    app_1 = Application.create(name: "John", address: "341 Bonanza", city: "Denver", state: "CO", zip: "80127", phone: "303", description: "great app")
    app_2 = Application.create(name: "John", address: "341 Bonanza", city: "Denver", state: "CO", zip: "80127", phone: "303", description: "great app")
    review_1 = shelter_1.reviews.create(title: "Found my best friend!",
                                    rating: "5",
                                    content: "The staff was very friendly and allowe dme to take my time meeting with any dog I thought was a godo fit. They even allowed and encouraged me to bring my other dog to meet one of the pups I was interested in. This flexibility helped me make sure the dog I met with was a good fit. I've found my new best friend!",
                                    picture: "https://www.pedigreedatabase.com/uploads/Reliya/images/13592736_10208042346674904_51006761307976618_n-1.jpg",
                                    shelter_id: shelter_1.id)
    review_2 = shelter_1.reviews.create(title: "All animals seemed very happy",
                                    rating: "4",
                                    content: "All animals seemed very happy and well taken care of. The kennels/cages were clean and each had a comfortable looking bed and a full water dish. Upon arriving I immediately noticed several volunteers and staff walking dogs or playing with them in the play yards.",
                                    picture: "",
                                    shelter_id: shelter_1.id)
    ApplicationPet.create(application_id: app_1.id, pet_id: pet_1.id)
    ApplicationPet.create(application_id: app_1.id, pet_id: pet_2.id)
    ApplicationPet.create(application_id: app_2.id, pet_id: pet_3.id)

    visit "shelters/#{shelter_1.id}"
    within('#shelter') do
      expect(page).to have_content("2")
      expect(page).to have_content("4.5")
    end
  end
end
