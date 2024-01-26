class Animal < ApplicationRecord
  has_many :bookings
  enum animal_type: { Dog: 0, Cat: 1 }
  validates :animal_type, inclusion: { in: animal_types.keys }



end