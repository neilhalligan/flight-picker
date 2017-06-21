class BookingsController < ApplicationController
  def new
    @num_tickets = params[:num_tickets].to_i
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build
    @passenger_count = 0
  end

  def create
    @flight = Flight.find(params[:flight_id])
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
  end

  private

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
