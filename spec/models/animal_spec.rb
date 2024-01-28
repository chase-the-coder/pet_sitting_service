require 'rails_helper'

RSpec.describe Animal, type: :model do
  describe 'associations' do
    it { should have_many(:bookings) }
  end

  describe 'validations' do
    it { should define_enum_for(:animal_type).with_values(Dog: 0, Cat: 1) }
    it { should validate_presence_of(:name) }
  end

  describe 'creation' do
    it 'raises an error when assigned an invalid animal_type' do
      animal = build(:animal)
      expect { animal.animal_type = 'InvalidType' }.to raise_error(ArgumentError)
    end
  end
end
