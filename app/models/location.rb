class Location < ActiveRecord::Base
  acts_as_mappable
  has_many :reviews
  validates :name, :lng, :lat, :formatted_address, :place_id, presence: true

  def self.near_places(args = {})
    name = args.fetch(:name, nil)
    lat = args.fetch(:lat, nil)
    lng = args.fetch(:lng, nil)
    prox = args.fetch(:prox, nil)

    self.within(prox, origin: [lat, lng]).where('LOWER(name) LIKE ?', "%#{name.downcase}%").to_json
  end

  def self.name_places(name)
    self.where('LOWER(name) LIKE ?', "%#{name.downcase}%").to_json
  end

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
