class Bike < ApplicationRecord
  has_many :bookings
  has_many :unavailabilities
end
