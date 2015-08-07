class Location < ActiveRecord::Base
  has_many :reviews

  validates :name, :lng, :lat, :formatted_address, presence: true
end
