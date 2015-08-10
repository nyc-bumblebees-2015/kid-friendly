require 'rails_helper'

describe Location do
  before(:each) do
    @location = build(:location)
  end

  it 'is valid with a name, latitude, longitude, formatted_address, place_id' do
    expect(@location).to be_valid
  end

  it 'is invalid without a name' do
    @location.name = nil
    expect(@location).to be_invalid
  end

  it 'is invalid without a latitude and longitude' do
    @location.lat = nil
    @location.lng = nil
    expect(@location).to be_invalid
  end

  it 'is invalid without a formatted address' do
    @location.formatted_address = nil
    expect(@location).to be_invalid
  end

  it 'is invalid without a place id' do
    @location.place_id = nil
    expect(@location).to be_invalid
  end

  it 'has a review' do
    user = create(:user)
    review = create(:review, user: user, location: @location)
    expect(@location.reviews.last).to eq(review)
  end

end
