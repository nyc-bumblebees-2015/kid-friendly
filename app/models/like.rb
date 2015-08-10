class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user, :review, presence: true
  validates :user, uniqueness: {scope: [:review], message: "already liked this review."}
end
