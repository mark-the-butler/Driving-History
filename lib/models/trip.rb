require 'time'

class Trip
  attr_reader :driver_name, :miles_driven

  def initialize(driver_name, start_time, stop_time, miles_driven)
    @driver_name = driver_name
    @start_time = start_time
    @stop_time = stop_time
    @miles_driven = miles_driven
  end

  def self.from_file(driver_name, start_time, stop_time, miles_driven)
    Trip.new(driver_name, Time.strptime(start_time, "%H:%M"), Time.strptime(stop_time, "%H:%M"), miles_driven.to_f)
  end

  def total_time
    @stop_time - @start_time
  end

  def average_speed
    SpeedCalculator.calculate_average(@miles_driven, total_time)
  end
end