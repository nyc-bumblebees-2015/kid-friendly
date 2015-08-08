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
end
