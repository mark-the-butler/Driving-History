require 'spec_helper'

describe DriverReportLineItem do
  before do
    trips = [
        Trip.from_file('Mark', '06:10', '06:40', '21.8'),
        Trip.from_file('Mark', '12:00', '13:20', '42')
    ]
    allow(SpeedCalculator).to receive(:calculate_average).and_return(35)
    @line_item = DriverReportLineItem.new('Mark', trips)
  end

  it 'should set the drivers name' do
    expect(@line_item.name).to eq('Mark')
  end

  it 'should return the total miles of all the trips' do
    expect(@line_item.total_miles).to eq(64)
  end

  it 'should return total travel time in seconds of all trips' do
    expect(@line_item.total_travel_time).to eq(6600)
  end

  it 'should return average speed in mph of all trips' do
    expect(@line_item.average_speed).to eq(35)
  end
end