class DriverReportLineItem
  attr_reader :name

  def initialize(name, trips)
    @name = name
    @trips = trips
  end

  def total_miles
    @trips.reduce(0) { |total, trip| total + trip.miles_driven }.round
  end

  def total_travel_time
    @trips.reduce(0) { |total, trip| total + trip.total_time }
  end

  def average_speed
    SpeedCalculator.calculate_average(total_miles, total_travel_time)
  end
end