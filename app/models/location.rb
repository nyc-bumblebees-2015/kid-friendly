class Location < ActiveRecord::Base
  acts_as_mappable
  has_many :reviews
  validates :name, :lng, :lat, :formatted_address, :place_id, presence: true
  before_save :set_yelp_id, if: :formatted_phone_number
  before_save :set_yelp_url, if: :formatted_phone_number

  def self.nearby_places(args = {})
    name = args.fetch(:name, nil)
    lat = args.fetch(:lat, nil)
    lng = args.fetch(:lng, nil)
    prox = args.fetch(:prox, nil)

    within(prox, origin: [lat, lng]).where('LOWER(name) LIKE ?', "%#{name.downcase}%").by_distance(origin: [lat, lng]).to_json
  end

  def self.name_places(name)
    where('LOWER(name) LIKE ?', "%#{name.downcase}%").to_json
  end

  def self.nearby_amenities(args = {})
    amenity = args.fetch(:amenity, nil)
    lat = args.fetch(:lat, nil)
    lng = args.fetch(:lng, nil)

    within('2', origin: [lat, lng]).where("#{amenity} = ?", true).by_distance(origin: [lat, lng])
  end

  def star_rating(attr)
    if rating?(attr)
      "★" * (self.reviews.sum("#{attr}") / self.reviews.count("#{attr} > 0"))
    else
      "no ratings provided"
    end
  end

  def rating?(attr)
    self.reviews.count("#{attr} > 0") >=1
  end

  def escaped_name
    self.name.gsub(" ","+")
  end

  def escaped_address
    self.formatted_address.gsub(" ","+").gsub(",+United+States","")
  end

  def query_string
    self.escaped_name + "+" + self.escaped_address
  end

  def directions_url
    "https://www.google.com/maps/dir/Current+Location/" + self.query_string
  end

  def reviews?
    self.reviews.count > 0
  end

  def amenities?
    [self.cribs,self.changing_stations,self.high_chairs,self.family_restrooms,self.restrooms,self.nursing_stations,self.water_fountains].any?
  end

  protected
    def escaped_phone_number
      "+1" + self.formatted_phone_number.gsub(/(\(| |\) |-)/, "")
    end

    def yelp_phone_lookup
      results = Yelp.client.phone_search(escaped_phone_number)
      results.businesses.first
    end

    def yelp_id_lookup
      Yelp.business(yelp_id)
    end

    def set_yelp_id
      self.yelp_id = yelp_phone_lookup.id
    end

    def set_yelp_url
      self.yelp_url = yelp_phone_lookup.url
    end
end
