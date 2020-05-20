class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.create(pet_params)

    if pet.save
      redirect_to "/shelters/#{shelter.id}/pets"
    elsif !pet.save
      missing_params = []
      pet_params.each do |key, value|
        if value == ""
          missing_params << "#{key}"
        end
      end
      flash[:notice] = "Pet not created. Missing one or more of the following fields: #{missing_params.join(", ")}."
      redirect_to "/shelters/#{shelter.id}/pets/new"
    end
  end

  def update
    pet = Pet.find(params[:id])
    if request.env['QUERY_STRING'] == "application_id=#{params[:application_id]}"
      pet.update_attribute(:adoptable, false)
      pet.save
      redirect_to "/pets/#{pet.id}"
    else
    pet.update({
      image: params[:image],
      name: params[:name],
      approximate_age: params[:approximate_age],
      sex: params[:sex],
      description: params[:description]
      })
    if pet.save
      redirect_to "/pets/#{pet.id}"
    elsif !pet.save
      missing_params = []
      pet_params.each do |key, value|
        if value == ""
          missing_params << "#{key}"
        end
      end
      flash[:notice] = "Pet not created. Missing one or more of the following fields: #{missing_params.join(", ")}."
      redirect_to "/pets/#{pet.id}/edit"
    end
    end
  end

  def revoke
    pet = Pet.find(params[:id])
    pet.update_attribute(:adoptable, true)
    pet.save
    redirect_to "/applications/#{params[:application_id].to_i}"
  end

  def destroy
    pet = Pet.find(params[:id])
    favorite.delete_pet(pet.id.to_s)
    session[:favorite] = favorite.pets
    pet.destroy
    redirect_to "/pets"
  end

  private

  def pet_params
    params.permit(:name, :image, :description, :approximate_age, :sex)
  end

end
