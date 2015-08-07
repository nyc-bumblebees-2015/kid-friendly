class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user_id, :review_id, presence: true
  validates :user_id, uniqueness: {scope: [:review_id]}
end
