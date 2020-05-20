class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def new
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def show
    @shelter = Shelter.find(params[:id])
    @reviews = @shelter.reviews
  end

  def create
    shelter = Shelter.new({
      name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip]
      })
    if shelter.save
      redirect_to "/shelters"
    elsif !shelter.save
      missing_params = []
      params[:shelter].each do |key, value|
        if value == ""
          missing_params << "#{key}"
        end
      end
      flash[:notice] = "Shelter not submitted. Missing one or more of the following fields: #{missing_params.join(", ")}."
      render :new
    end
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update({
      name: params[:shelter][:name],
      address: params[:shelter][:address],
      city: params[:shelter][:city],
      state: params[:shelter][:state],
      zip: params[:shelter][:zip]
      })
      shelter.save
      redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    shelter = Shelter.find(params[:id])
    shelter.delete_pets
    shelter.delete_reviews
    Shelter.destroy(params[:id])
    redirect_to "/shelters"
  end

end
