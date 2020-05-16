class FavoritesController < ApplicationController

  def index
    @pets = favorite.pets.map {|pet_id| Pet.find(pet_id)}
    if favorite.pets.length == 0
      flash[:notice] = "You haven't favorited any pets. Go find a pet you love!"
    end
  end
  
  def update
    pet = Pet.find(params[:pet_id])
    favorite.add_pet(pet.id)
    session[:favorite] = favorite.pets
    flash[:notice] = "You now have added #{pet.name} to your favorites!"
    redirect_to "/pets/#{pet.id}"
  end

  def destroy 
    favorite.remove_all

    redirect_to "/favorites"
  end
end 