class FavoritesController < ApplicationController

  def index
    @pets = favorite.pets.map {|pet_id| Pet.find(pet_id)}
    if favorite.pets.length == 0
      flash[:notice] = "You haven't favorited any pets. Go find a pet you love!"
    end
    @applications = Application.all
  end

  def update
    pet = Pet.find(params[:pet_id])
    favorite.add_pet(pet.id)
    session[:favorite] = favorite.pets
    flash[:notice] = "You now have added this pet to your favorites!"
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    if request.env['PATH_INFO'] == '/favorites'
      favorite.remove_all
    else
      pet = Pet.find(params[:pet_id])
      favorite.delete_pet(pet.id)
      session[:favorite] = favorite.pets
      flash[:notice] = "You have deleted this Pet from your favorites!"
    end
    redirect_to(request.env["HTTP_REFERER"])
  end
end
