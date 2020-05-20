class Shelter < ApplicationRecord
  has_many :pets
  has_many :reviews
  validates_presence_of :name, :address, :city, :state, :zip

  def adopted_pet?(shelter)
    pets_pending = shelter.pets.map do |pet|
      if !pet.adoptable
        false
      end
    end
    pets_pending.include?(false)
  end

  def delete_pets
    pets.each do |pet|
      pet.destroy
    end
  end

  def delete_reviews
    reviews.each do |review|
      review.destroy
    end
  end

  def total_pets
    pets.total_count
  end


#   I see statistics for that shelter, including:
# - count of pets that are at that shelter
# - average shelter review rating
# - number of applications on file for that shelter

end
