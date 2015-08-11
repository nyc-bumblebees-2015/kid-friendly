require 'rails_helper'

RSpec.describe Review do
  it "is valid with a location, user, and overall_rating" do
    expect(create(:review)).to be_valid
  end

  it "is valid with a fully filled out review" do
    expect(create(:complete_review)).to be_valid
  end

  it "does not save an empty string for body" do
    review = create(:review, body: "")
    expect(review.body).to be_nil
  end

  it "does not save a blank string for body" do
    review = create(:review, body: "   ")
    expect(review.body).to be_nil
  end

  it "has a helpful_count" do
    review = create(:review)
    user = create(:user, username: "test", email: "test@example.com")
    expect{
      like = create(:like, review: review , user: user)
    }.to change(review, :helpful_count).by(1)
  end

  it "is not valid without a user" do
    review = build(:review_without_user)
    expect(review).to be_invalid
    expect(review.errors[:user]).to include("can't be blank")
  end
end
