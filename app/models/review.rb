class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :likes

  validates :location, :user, :overall_rating, presence: true
  validates :overall_rating,
            :cleanliness_rating,
            :spaciousness_rating, numericality: { only_integer: true,
                                                  greater_than_or_equal_to: 1,
                                                  less_than_or_equal_to: 5
                                                }

  def helpful_count
    self.likes.count
  end

  def overall_star_rating
    "★" * self.overall_rating
  end
end
