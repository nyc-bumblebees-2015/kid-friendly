class ReviewsController < ApplicationController
  def index
  end

  def new
    @location = Location.find_by(id: params[:location_id])
    @review = Review.new
  end

  def create
    review = Review.new(review_params)
    review.location = Location.find_by(id: params[:location_id])
    review.user = current_user
    if review.save
      redirect_to location_path(review.location), notice: "Review created successfully!"
    else
      flash[:errors] = review.errors.full_messages
      redirect_to location_path(review.location)
    end
  end

  private

  def review_params
    params.require(:review).permit(:location_id, :user_id, :overall_rating, :cleanliness_rating, :spaciousness_rating, :body)
  end
end
