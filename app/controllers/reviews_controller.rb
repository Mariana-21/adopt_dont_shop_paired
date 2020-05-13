class ReviewsController < ApplicationController

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review_shelter = Review.find(params[:id])
    shelter = Shelter.find(review_shelter.shelter_id)
    review = shelter.reviews.create!(review_params)
    review.save

      redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    review_shelter = Review.find(params[:id])
    shelter = Shelter.find(review_shelter.shelter_id)
    Review.destroy(params[:id])
    redirect_to "/shelters/#{shelter.id}"
  end

  private

  def review_params
    params.permit(:title, :rating, :content, :picture)
  end
end
