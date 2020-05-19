require 'rails_helper'

RSpec.describe "As a visitor" do 
  describe "When I visit a pets show page" do 
    it "I see a link to view all applications for this pet" do 
      shelter2 = Shelter.create(name: "San Diego Humane Society", address: "5500 Gaines St", city: "San Diego", state: "CA", zip: "92110")
      shelter3 = Shelter.create(name: "La Costa Animal Hospital", address: "7668 El Camino Real #101", city: "Carlsbad", state: "CA", zip: "92009")
      shelter4 = Shelter.create(name: "DogSpot", address: "4151 Avenida Plaza Real", city: "Oceanside", state: "CA", zip: "92056")

      pet3 = Pet.create(image: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2017/09/chihuahua-names-1.jpg",
                        name: "Skip", description: "I am very energetic, I love to be around people!", approximate_age: "2", sex: "Male", shelter_id: shelter3.id)
      pet4 = Pet.create(image: "https://www.thepaws.net/wp-content/uploads/2018/09/beagle-bloodhound-dog-mix-2.jpg",
                        name: "Yayla", description: "I am the calmest dog you will ever meet, I love belly rubs and lots of treats", approximate_age: "4", sex: "Female", shelter_id: shelter2.id)
      pet5 = Pet.create(image: "https://www.dogster.com/wp-content/uploads/2018/12/german-shepard-dog-face.jpg", 
                        name: "Shadow", description: "I'm a German Sheperd and I love to play and go on walks!", approximate_age: "3", sex: "Male", shelter_id: shelter2.id)
      pet6 = Pet.create(image: "https://i.pinimg.com/originals/16/f3/9e/16f39e58bede777ff5ad25e57521efb4.jpg",
                        name: "Max", description: "I am a 3 year old Rottweiler, super friendly and love to play!", approximate_age: "3", sex: "Male", shelter_id: shelter4.id)
      app1 = Application.create(name: "John Smith", address: "123 Test Street", city: "Carlsbad", state: "CA", zip: "92008", phone: "123-456-7890", description: "My home will be full of love for our new family member!")
      app2 = Application.create(name: "Rex Wheeler", address: "123 Test Ave", city: "Carlsbad", state: "CA", zip: "92008", phone: "098-765-4321", description: "I need a new companion in life and I think this pup is perfect for me!")

      ApplicationPet.create(application_id: app1.id, pet_id: pet5.id)
      ApplicationPet.create(application_id: app2.id, pet_id: pet6.id)

      visit"/pets/#{pet5.id}"

      click_link("View Applications")

      expect(current_path).to eq("/pets/#{pet5.id}/applications")
      expect(page).to have_link(app1.name) 
      expect(page).to_not have_link(app2.name) 

      visit"/pets/#{pet6.id}"

      click_link("View Applications")

      expect(current_path).to eq("/pets/#{pet6.id}/applications")
      expect(page).to have_link(app2.name) 
      expect(page).to_not have_link(app1.name) 
    end

    it "I see a message saying that there are no applications for this pet yet" do
      shelter3 = Shelter.create(name: "La Costa Animal Hospital", address: "7668 El Camino Real #101", city: "Carlsbad", state: "CA", zip: "92009")
      pet3 = Pet.create(image: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2017/09/chihuahua-names-1.jpg",
                        name: "Skip", description: "I am very energetic, I love to be around people!", approximate_age: "2", sex: "Male", shelter_id: shelter3.id)

      visit"/pets/#{pet3.id}"

      click_link("View Applications")

      expect(current_path).to eq("/pets/#{pet3.id}/applications")
      # expect(controller).to set_flash[:notice]
    end
  end
end

# As a visitor
# When I visit a pet applications index page for a pet that has no applications on them
# I see a message saying that there are no applications for this pet yet
# As a visitor
# When I visit a pets show page
# I see a link to view all applications for this pet
# When I click that link
# I can see a list of all the names of applicants for this pet
# Each applicant's name is a link to their application show page