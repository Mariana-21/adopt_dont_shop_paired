class FavoritesController < ApplicationController

  def index
    @pets = favorite.pets.map {|pet_id| Pet.find(pet_id)}
  end

  def update
    pet = Pet.find(params[:pet_id])
    favorite.add_pet(pet.id)
    session[:favorite] = favorite.pets
    flash[:notice] = "You now have added #{pet.name} to your favorites!"
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    favorite.delete_pet(pet.id)
    session[:favorite] = favorite.pets
    flash[:notice] = "You have deleted this Pet from your favorites!"
    redirect_to "/pets/#{params[:pet_id]}"
  end
end
