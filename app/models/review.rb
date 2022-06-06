class Review < ApplicationRecord
  belongs_to :hike
  belongs_to :user

  validates :content, :rating, :difficulty, presence: true
  validates :content, length: { minimum: 5 }
end
