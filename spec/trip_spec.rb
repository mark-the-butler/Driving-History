require 'spec_helper'

describe Trip do
  before do
    @driver_name = 'Dan'
    @start_time = '07:15'
    @stop_time = '07:45'
    miles_driven = '17.3'

    @trip = Trip.from_file(@driver_name, @start_time, @stop_time, miles_driven)
  end

  it 'should return an instance of Trip' do
    expect(@trip).to be_an_instance_of(Trip)
  end

  it 'should return driver name' do
    expect(@trip.driver_name).to eq(@driver_name)
  end

  it 'should return miles_driven' do
    expect(@trip.miles_driven).to eq(17.3)
  end

  it 'should return total trip time' do
    expect(@trip.total_time).to eq(1800)
  end

  it 'should return average speed of trip' do
    expect(@trip.average_speed).to eq(35)
  end
end


