class Hike < ApplicationRecord
  has_many :scores, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
  has_one_attached :gpx

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
