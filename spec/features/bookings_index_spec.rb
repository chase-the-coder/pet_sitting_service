require 'rails_helper'

RSpec.feature "Bookings index", type: :feature do
  let!(:booking1) { create(:booking, user_attributes: { first_name: 'John', last_name: 'Doe' }, animal_attributes: { name: 'Rex', animal_type: 'Dog' }, hours_requested: 2, date_of_service: Date.tomorrow) }
  let!(:booking2) { create(:booking, user_attributes: { first_name: 'Jane', last_name: 'Smith' }, animal_attributes: { name: 'Max', animal_type: 'Cat' }, hours_requested: 3, date_of_service: Date.today) }


  before do
    visit admin_path
  end

  scenario "Page loads successfully" do
    expect(page.status_code).to eq(200)
  end

  scenario "Page displays the correct elements" do
    expect(page).to have_content "All Bookings"
    expect(page).to have_selector "table"
    expect(page).to have_content "User First Name"
    expect(page).to have_content "User Last Name"
    expect(page).to have_content "Animal Name"
    expect(page).to have_content "Animal Type"
    expect(page).to have_content "Hours Requested"
    expect(page).to have_content "Date of Service"
    expect(page).to have_content "Total Cost"
  end

  scenario "Page displays the correct data" do
    within("tbody") do
      expect(page).to have_content booking1.user.first_name
      expect(page).to have_content booking1.user.last_name
      expect(page).to have_content booking1.animal.name
      expect(page).to have_content booking1.animal.animal_type
      expect(page).to have_content booking1.hours_requested
      expect(page).to have_content booking1.date_of_service
      expect(page).to have_content booking1.cost

      expect(page).to have_content booking2.user.first_name
      expect(page).to have_content booking2.user.last_name
      expect(page).to have_content booking2.animal.name
      expect(page).to have_content booking2.animal.animal_type
      expect(page).to have_content booking2.hours_requested
      expect(page).to have_content booking2.date_of_service
      expect(page).to have_content booking2.cost
    end
  end
end