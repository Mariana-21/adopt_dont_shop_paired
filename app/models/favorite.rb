class Favorite
  attr_reader :pets

  def initialize(initial_pets)
    @pets = initial_pets ||= Array.new
  end

  def total_count
    @pets.length
  end

  def add_pet(id)
    @pets << id.to_s
  end

  def remove_all
    @pets.clear
  end

  def delete_pet(pet_id)
    @pets.delete(pet_id.to_s)
  end
end
