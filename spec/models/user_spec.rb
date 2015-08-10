require 'rails_helper'

describe User do
  before(:each) do
    @user = create(:user)
  end

  it "is valid with a username, first name, last name, email address, and password" do
    expect(@user).to be_valid
  end

  it "is invalid without a username" do
    @user.username = nil
    expect(@user).to be_invalid
  end

  it "is invalid without a first name" do
    @user.first_name = nil
    expect(@user).to be_invalid
  end

  it "is invalid without a last name" do
    @user.last_name = nil
    expect(@user).to be_invalid
  end

  it "is invalid without an email address" do
    @user.email = nil
    expect(@user).to be_invalid
  end

  it "is invalid without a properly formatted email address" do
    @user.email = 'mysteryman.google.com'
    expect(@user).to be_invalid
    @user.email = '@'
    expect(@user).to be_invalid
  end

  it "is invalid without a unique username" do
    dup_username_user = build(:user, first_name: 'Jose', last_name: 'Sue', email: 'josesue@example.com')
    expect(dup_username_user).to be_invalid
  end

  it "is invalid without a unique email address" do
    dup_email_user = build(:user, username: "AppsAllDay", first_name: 'Johnny', last_name: 'Apple')
    expect(dup_email_user).to be_invalid
  end

  it 'has a review' do
    location = create(:location)
    review = create(:review, user: @user, location: location)
    expect(@user.reviews.last).to eq(review)
  end

  it 'has a like' do
    location = create(:location)
    review = create(:review, user: @user, location: location)
    like = create(:like, user: @user, review: review)
    expect(@user.likes.last).to eq(like)
  end

end
