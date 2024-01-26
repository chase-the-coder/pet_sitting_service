class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  validates :user, :animal, :hours_requested, :date_of_service, presence: true
  validates :hours_requested, numericality: { only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 8 }
end