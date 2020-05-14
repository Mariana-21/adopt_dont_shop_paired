class FavoritesController < ApplicationController
  def update
    pet = Pet.find(params[:pet_id])
    favorite.add_pet(pet.id)
    session[:favorite] = favorite.pets
    flash[:notice] = "You now have added #{pet.name} to your favorites!"
    redirect_to "/pets/#{pet.id}"
  end
end 