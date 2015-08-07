class Location < ActiveRecord::Base
  has_many :reviews

  validates :name, :lng, :lat, :formatted_address, :place_id, presence: true
end
