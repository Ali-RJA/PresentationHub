class Feedback < ApplicationRecord
  belongs_to :presentation
  belongs_to :user

  validates :rating, presence: true
  validates :user_id, presence: true
  validates :comments, presence: true
end
