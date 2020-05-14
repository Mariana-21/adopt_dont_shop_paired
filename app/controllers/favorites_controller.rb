class FavoritesController < ApplicationController
  def update
    pet = Pet.find(params[:pet_id])
    flash[:success] = "You have added #{pet.name} to your favorites!"
    redirect_to '/pets'
  end 
end 