class Presentation < ApplicationRecord
  has_many :feedback, dependent: :delete_all
  belongs_to :user
  has_one_attached :document

  validates :topic, presence: true
  validates :user_id, presence: true
  validates :date, presence: true
end
