class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @booking.build_user
    @booking.build_animal
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = User.find_or_initialize_by(booking_params[:user_attributes])
    @booking.animal = Animal.find_or_initialize_by(booking_params[:animal_attributes])

    if @booking.save
      flash[:notice] = 'Booking was successfully created.'
      redirect_to root_path
    else
      flash[:alert] = @booking.errors.full_messages.join(', ')
      redirect_to root_path
      # Ideally I would not redirect here, I would render :new, but I'm having trouble getting the form errors to be displayed when the form fields are not valid, so I'm redirecting to show the errors. I think this a rails 7 issue.
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:hours_requested, :date_of_service, :total_cost,
                                    user_attributes: %i[first_name last_name], animal_attributes: %i[name animal_type])
  end
end
