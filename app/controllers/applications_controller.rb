class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
  end

  def new
    @favorites = favorite.pets.map {|pet_id| Pet.find(pet_id)}
  end

  def create
    pets = Pet.find(params[:adoptable_pet])
    application = Application.create(application_params)
    if application.save
      flash[:notice] = "Your Application has been submitted for these pets!"
      pets.each do |pet|
        application.pets << pet
      end
      pets.each {|pet| favorite.delete_pet(pet.id.to_s)}
      redirect_to "/favorites"

    elsif !application.save
      flash[:notice] = "Application not submitted. Missing one or more of the following fields: Name, Address, City, State, Zip, Phone or Description."
      redirect_to "/applications/new"
    end
  end

  private

  def application_params
    params.permit(:name, :address, :city, :state, :zip, :phone, :description)
  end

end
