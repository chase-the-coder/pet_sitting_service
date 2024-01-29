# Rails Application

This is a Rails application that uses Tailwind CSS for styling and RSpec for testing.

## Ruby Version

This application uses Ruby version 3.1.2.

## Database

This application uses SQLite for development and testing.

## Setup

1. Clone the repository:

```bash
git clone https://github.com/chase-the-coder/pet_sitting_service.git
cd pet_sitting_service
```

2. Install the dependencies

```bash
bundle install
```

3. Create the database and seed it:

```bash
rails db:create
rails db:migrate
rails db:seed
```

## Running the Server

4. Run the server. This project is using tailwind css, so run the server with the following command

```bash
bin/dev
```

Running the Tests
This application uses RSpec for testing. To run the tests, use:

```bash
rspec
```

Routes
This application has the following routes:

- `root 'bookings#new'`: The landing page with the form.
- `get 'admin', to: 'bookings#index'`: The admin page.
- `post 'bookings', to: 'bookings#create'`: Create a new booking.

## Discussion Points

These are some notes about the project and future improvements to consider:

- Adding authorization to the admin route
- Adding pagination to the admin route
- Consider creating separate controllers for Animals and Users based on project needs. Currently the creation for Users and Aminals is nested within the bookings controller for simplicity.
- Testing structure and if any tests are missing
