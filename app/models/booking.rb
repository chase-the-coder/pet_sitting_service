class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :animal
  accepts_nested_attributes_for :user, :animal
  validates :user, :animal, :hours_requested, :date_of_service, presence: true
  validates :hours_requested, numericality: { only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 8 }
  validate :date_of_service_cannot_be_in_the_past

  BASE_CHARGE = 20
  DOG_CHARGE = 10
  CAT_CHARGE = 5

  def cost
    BASE_CHARGE + additional_charge
  end

  private

  def additional_charge
    case animal.animal_type
    when 'Dog'
      hours_requested * DOG_CHARGE
    when 'Cat'
      hours_requested * CAT_CHARGE
    else
      0
    end
  end

  def date_of_service_cannot_be_in_the_past
    if date_of_service.present? && date_of_service < Date.today
      errors.add(:date_of_service, "Date can't be in the past")
    end
  end
end