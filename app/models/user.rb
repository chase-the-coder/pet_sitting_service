class User < ApplicationRecord
  has_many :bookings
  validates :first_name, :last_name, presence: true
  before_validation :trim_names


  private

  def trim_names
    self.first_name = first_name.strip if first_name.present?
    self.last_name = last_name.strip if last_name.present?
  end
end