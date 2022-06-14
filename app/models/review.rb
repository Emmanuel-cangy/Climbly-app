class Review < ApplicationRecord
  belongs_to :hike
  belongs_to :user
  has_many_attached :photos

  validates :content, :rating, :difficulty, presence: true
  validates :content, length: { minimum: 5 }
end
