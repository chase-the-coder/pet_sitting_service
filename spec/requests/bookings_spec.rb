require 'rails_helper'

RSpec.describe 'Bookings', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /admin' do
    it 'returns http success' do
      get admin_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /bookings' do
    let(:user) { create(:user) }
    let(:animal) { create(:animal) }

    let(:booking_attributes) do
      attributes_for(:booking, user_id: user.id, animal_id: animal.id, date_of_service: Date.tomorrow)
    end
    let(:invalid_attributes) do
      attributes_for(:booking, user_id: user.id, animal_id: animal.id, date_of_service: Date.yesterday)
    end

    context 'with valid parameters' do
      it 'creates a new Booking' do
        expect do
          post bookings_path, params: { booking: booking_attributes }
        end.to change(Booking, :count).by(1)
      end

      it 'redirects to the root' do
        post bookings_path, params: { booking: booking_attributes }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Booking' do
        expect do
          post bookings_path, params: { booking: invalid_attributes }
        end.not_to change(Booking, :count)
      end

      it 'redirects to the root' do
        post bookings_path, params: { booking: invalid_attributes }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
