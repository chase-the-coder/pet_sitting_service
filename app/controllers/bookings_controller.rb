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
      flash[:alert] = @booking.errors.full_messages.join(", ")
      render :new
    end
  end
  
  private
  
  def booking_params
    params.require(:booking).permit(:hours_requested, :date_of_service, :total_cost, user_attributes: [:first_name, :last_name], animal_attributes: [:name, :animal_type])
  end
end
