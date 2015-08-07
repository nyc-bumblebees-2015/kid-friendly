class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  has_many :likes

  validates :first_name, :last_name, :username, :email, :password, presence: true
  validates :email, :username, uniqueness: true
  validates :password, length: {minimum: 6}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
