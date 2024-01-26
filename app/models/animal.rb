class Animal < ApplicationRecord
  has_many :bookings
  enum animal_type: { dog: 0, cat: 1 }
  validates :animal_type, inclusion: { in: animal_types.keys }
end