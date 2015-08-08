class LikesController < ApplicationController
  def create
    review = Review.find_by(id: params[:review_id])
    like = Like.new(review: review, user: current_user)
    if like.save! && request.xhr?
      @likes = review.likes.count
      render json: {likes: @likes}.to_json
    else
      redirect_to like.review.location
    end
  end
end
