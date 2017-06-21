class FlightsController < ApplicationController
  def index
    # @flight = Flight.new
    @airports = Airport.all.map { |a| a.airport_code }
    # @available_dates = Flight.all.map { |f| [f.date, f.date_formatted] }.uniq
    @available_dates = Flight.pluck(:date).map { |date| [date, date.strftime("%y%m%d")] }.uniq.sort
    unless params[:date].nil?
      date = Date.strptime(params[:date],"%y%m%d")
      flight_results_to = Flight.joins(
        "JOIN airports ON airports.id = flights.to_airport_id")
        .where("airports.airport_code = ?", params[:to_code])
      flight_results_from = Flight.joins(
        "JOIN airports ON airports.id = flights.from_airport_id")
        .where("airports.airport_code = ?", params[:from_code])
      flight_results_date = Flight.where(date: date)
      @flight_results = flight_results_date & flight_results_from & flight_results_to
    end
  end
end
