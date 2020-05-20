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

end
