# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe 'associations' do
    it { should have_many(:bookings) }
  end

  describe '#trim_names' do
    let(:user) { create(:user, first_name: ' John ', last_name: ' Doe ') }

    it 'trims leading and trailing whitespace from first_name and last_name' do
      user.valid?
      expect(user.first_name).to eq('John')
      expect(user.last_name).to eq('Doe')
    end
  end
end