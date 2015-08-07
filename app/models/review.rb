class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  validates :location_id, :user_id, :overall_rating, presence: true
  validates_format_of :overall_rating, :cleanliness_rating, :spaciousness_rating, :with => /^[1-5]$/
end
