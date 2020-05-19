class ApplicationPetsController < ApplicationController
  def index
    @pet = Pet.find(params[:pet_id])
    @applications = Application.all
  end
end