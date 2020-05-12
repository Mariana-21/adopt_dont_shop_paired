class ReviewsController < ApplicationController

  private

  def review_params
    params.permit(:title, :rating, :content, :picture)
  end
end
