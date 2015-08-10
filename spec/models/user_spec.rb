require 'rails_helper'

describe User do
  it "is valid with a username, first name, last name, email address, and password" do
    user = User.new(
      first_name: "John",
      last_name: "Doe",
      email: "test@example.com",
      username: "johndoe",
      password: "123456")
    expect(user).to be_valid
  end

  it "is invalid without a username"
  it "is invalid without a first name"
  it "is invalid without a last name"
  it "is invalid without an email address"
  it "is invalid without a properly formatted email address"
  it "is invalid without a unique username"
  it "is invalid without a unique email address"
end