class Unavailability < ApplicationRecord
  belongs_to :bike
  validates :date, presence: true
  validates :date, uniqueness: { scope: :bike_id }
end
