require 'spec_helper'

describe SpeedCalculator do
  it 'should return average speed of travel in mph' do
    miles = 17.3
    time = 1800

    expect(SpeedCalculator.calculate_average(miles, time)).to eq(35)
  end
end