class LineItemGenerator
  def report_lines(drivers, trips)
    valid_trips = filter_invalid_trips(trips)
    drivers.map do |driver|
      DriverReportLineItem.new(driver.name, valid_trips.select { |trip| trip.driver_name.downcase == driver.name.downcase })
    end
  end

  private

  def filter_invalid_trips(trips)
    trips.reject { |trip| trip.average_speed < 5 || trip.average_speed > 100 }
  end
end