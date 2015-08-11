require 'rails_helper'

RSpec.describe Like do
  it "is valid with a user and a review" do
    expect(create(:valid_like)).to be_valid
  end

  it "does not allow duplicate user/review combinations" do
    like = create(:valid_like)
    duplicate_like = build(:valid_like, user: like.user, review: like.review)
    expect(duplicate_like).to be_invalid
    expect(duplicate_like.errors[:user]).to include("already liked this review.")
  end

  it "is not valid without a user" do
    bad_like = build(:like_without_user)
    expect(bad_like).to be_invalid
  end

  it "is not valid without a review" do
    bad_like = build(:like_without_review)
    expect(bad_like).to be_invalid
  end
end
