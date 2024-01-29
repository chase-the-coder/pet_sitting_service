require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe '#cost' do
    let(:user) { create(:user) }
    let(:booking) do
      create(:booking, user:, animal_attributes: { name: 'Rex', animal_type: }, hours_requested:,
                       date_of_service: Date.tomorrow)
    end

    context 'when the animal is a dog' do
      let(:animal_type) { 'Dog' }
      let(:hours_requested) { 5 }

      it 'calculates the correct cost' do
        expect(booking.cost).to eq(20 + 10 * hours_requested)
      end
    end

    context 'when the animal is a cat' do
      let(:animal_type) { 'Cat' }
      let(:hours_requested) { 3 }

      it 'calculates the correct cost' do
        expect(booking.cost).to eq(20 + 5 * hours_requested)
      end
    end

    context 'when the hours requested is the minimum' do
      let(:animal_type) { 'Dog' }
      let(:hours_requested) { 2 }

      it 'calculates the correct cost' do
        expect(booking.cost).to eq(20 + 10 * hours_requested)
      end
    end

    context 'when the hours requested is the maximum' do
      let(:animal_type) { 'Dog' }
      let(:hours_requested) { 8 }

      it 'calculates the correct cost' do
        expect(booking.cost).to eq(20 + 10 * hours_requested)
      end
    end
  end
end
