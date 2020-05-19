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
    pet = shelter.pets.create!(pet_params)
    pet.save

      redirect_to "/shelters/#{shelter.id}/pets"
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
    pet.save
    redirect_to "/pets/#{pet.id}"
    end
  end

  def destroy
    Pet.destroy(params[:id])
    redirect_to "/pets"
  end

  private

  def pet_params
    params.permit(:name, :image, :description, :approximate_age, :sex)
  end

end
