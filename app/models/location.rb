class Location < ActiveRecord::Base
  has_many :reviews

  validates :name, :lng, :lat, :formatted_address, :place_id, presence: true

  def star_rating(attr)
    "★" * (self.reviews.sum("#{attr}") / self.reviews.count("#{attr} > 0"))
  end

  def escaped_address
    self.name.gsub(" ","+") + "+" + self.formatted_address.gsub(" ","+")
  end

  def amenities?
    [self.cribs,self.changing_stations,self.high_chairs,self.family_restrooms,self.restrooms,self.nursing_stations,self.water_fountains].any?
  end
end
