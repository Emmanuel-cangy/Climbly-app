class Hike < ApplicationRecord
  has_many :scores
  has_many :reviews
end
