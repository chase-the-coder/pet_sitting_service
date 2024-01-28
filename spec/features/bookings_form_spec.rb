require 'rails_helper'

RSpec.feature "Booking management", type: :feature do
  scenario "User creates a new booking with valid data" do
    visit root_path

    within("form") do
      fill_in 'First name', with: 'John'
      fill_in 'Last name', with: 'Doe'
      fill_in 'Animal name', with: 'Buddy'
      select 'Dog', from: 'Animal type'
      select '4', from: 'Hours requested'
      fill_in 'Date of service', with: '2024-12-31'
    end

    click_button 'Submit'

    expect(page).to have_content 'Booking was successfully created.'
  end

  scenario "Submitting the form redirects the user to another page" do
    visit root_path

    within("form") do
      fill_in 'First name', with: 'John'
      fill_in 'Last name', with: 'Doe'
      fill_in 'Animal name', with: 'Buddy'
      select 'Dog', from: 'Animal type'
      select '4', from: 'Hours requested'
      fill_in 'Date of service', with: '2024-12-31'
    end

    click_button 'Submit'

    expect(current_path).to eq root_path
  end

  scenario "User tries to create a new booking with invalid data" do
    visit root_path
  
    within("form") do
      # ... leave fields blank ...
    end
  
    click_button 'Submit'
  
    expect(page).to have_content "User first name can't be blank"
    expect(page).to have_content "User last name can't be blank"
    expect(page).to have_content "Animal name can't be blank"
    expect(page).to have_content "Date of service can't be blank"
  end

end