require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit a applications show page" do
    it "I can see all that applications information and pets related to it." do
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
      ApplicationPet.create(application_id: app_1.id, pet_id: pet_1.id)
      ApplicationPet.create(application_id: app_1.id, pet_id: pet_2.id)

      visit "/applications/#{app_1.id}"
      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_2.name)
      expect(page).to have_content(app_1.name)
      expect(page).to have_content(app_1.address)
      expect(page).to have_content(app_1.city)
      expect(page).to have_content(app_1.state)
      expect(page).to have_content(app_1.zip)
      expect(page).to have_content(app_1.phone)
      expect(page).to have_content(app_1.description)
    end
    it "I can use a link to approve an application" do
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
      ApplicationPet.create(application_id: app_1.id, pet_id: pet_1.id)
      ApplicationPet.create(application_id: app_1.id, pet_id: pet_2.id)
      ApplicationPet.create(application_id: app_2.id, pet_id: pet_3.id)

      visit "/applications/#{app_1.id}"
      within("#pet-#{pet_1.id}") do
          click_on "Approve"
      end

      expect(current_path).to eq("/pets/#{pet_1.id}")
      expect(page).to have_content("Status: Pending")
    end

    it "I no longer see a link to approve the application for that pet" do
      shelter2 = Shelter.create(name: "San Diego Humane Society", address: "5500 Gaines St", city: "San Diego", state: "CA", zip: "92110")
      # shelter3 = Shelter.create(name: "La Costa Animal Hospital", address: "7668 El Camino Real #101", city: "Carlsbad", state: "CA", zip: "92009")
      shelter4 = Shelter.create(name: "DogSpot", address: "4151 Avenida Plaza Real", city: "Oceanside", state: "CA", zip: "92056")

      # pet3 = Pet.create(image: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2017/09/chihuahua-names-1.jpg",
      #                   name: "Skip", description: "I am very energetic, I love to be around people!", approximate_age: "2", sex: "Male", shelter_id: shelter3.id)
      # pet4 = Pet.create(image: "https://www.thepaws.net/wp-content/uploads/2018/09/beagle-bloodhound-dog-mix-2.jpg",
                        # name: "Yayla", description: "I am the calmest dog you will ever meet, I love belly rubs and lots of treats", approximate_age: "4", sex: "Female", shelter_id: shelter2.id)
      pet5 = Pet.create(image: "https://www.dogster.com/wp-content/uploads/2018/12/german-shepard-dog-face.jpg", 
                        name: "Shadow", description: "I'm a German Sheperd and I love to play and go on walks!", approximate_age: "3", sex: "Male", shelter_id: shelter2.id)
      pet6 = Pet.create(image: "https://i.pinimg.com/originals/16/f3/9e/16f39e58bede777ff5ad25e57521efb4.jpg",
                        name: "Max", description: "I am a 3 year old Rottweiler, super friendly and love to play!", approximate_age: "3", sex: "Male", shelter_id: shelter4.id)
      app1 = Application.create(name: "John Smith", address: "123 Test Street", city: "Carlsbad", state: "CA", zip: "92008", phone: "123-456-7890", description: "My home will be full of love for our new family member!")
      app2 = Application.create(name: "Rex Wheeler", address: "123 Test Ave", city: "Carlsbad", state: "CA", zip: "92008", phone: "098-765-4321", description: "I need a new companion in life and I think this pup is perfect for me!")

      ApplicationPet.create(application_id: app1.id, pet_id: pet5.id)
      ApplicationPet.create(application_id: app2.id, pet_id: pet6.id)

      visit"/applications/#{app1.id}"

      within("#pet-#{pet5.id}") do 
        click_on "Approve"
      end 

      expect(current_path).to eq("/pets/#{pet5.id}")

      click_on "View Applications"

      expect(current_path).to eq("/pets/#{pet5.id}/applications")
      click_on "#{app1.name}"

      expect(current_path).to eq("/applications/#{app1.id}")
      expect(page).to_not have_button("Approve")

      within("#pet-#{pet5.id}") do 
        click_on "Unapprove"
      end 
      expect(current_path).to eq("/applications/#{app1.id}")
      expect(page).to have_button("Approve")
    end
  end
end



# As a visitor
# After an application has been approved for a pet
# I no longer see a link to approve the application for that pet
# When I visit that applications show page
# But I see a link to unapprove the application for that pet
# When I click on the link to unapprove the application
# I'm taken back to that applications show page
# And I can see the button to approve the application for that pet again
# When I go to that pets show page
# I can see that the pets adoption status is now back to adoptable
# And that pet is not on hold anymore

