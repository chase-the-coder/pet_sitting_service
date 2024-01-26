class User < ApplicationRecord
  has_many :bookings
  validates :first_name, :last_name, presence: true
end