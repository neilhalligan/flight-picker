class BookingsController < ApplicationController
  before_action :find_flight, only: [:new, :create]

  def new
    @num_tickets = params[:num_tickets].to_i
    @booking = @flight.bookings.build
    @passenger_count = 0
  end

  def create
    @booking = @flight.bookings.build(booking_params)
    if @booking.save
      redirect_to @booking
      flash[:success] = "Booking successful"
    else
      raise
      flash[:error] = "Booking failed"
      redirect_to root_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    @amount = 15025*@booking.passengers.count
  end

  private

    def find_flight
      @flight = Flight.find(params[:flight_id])
    end

    def booking_params
      params.require(:booking).permit(
        :flight_id,
        :passengers_attributes => [
          :name,
          :email
        ]
      )
    end
end
