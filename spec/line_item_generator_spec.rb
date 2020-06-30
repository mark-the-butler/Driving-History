require 'spec_helper'

describe LineItemGenerator do
  let(:drivers) { [Driver.new('Mark'), Driver.new('Dan')] }
  let(:trips) {
    [
        Trip.from_file('Mark','07:15', '07:45', '17.3'),
        Trip.from_file('Dan', '06:12', '06:32', '21.8'),
        Trip.from_file('Dan', '12:01', '13:16', '42')
    ]
  }

  before do
    @line_item_generator = LineItemGenerator.new
  end

  it 'should map each driver to a DriverReportLine' do
    actual = @line_item_generator.report_lines(drivers, trips)

    actual.each { |line| expect(line).to be_an_instance_of(DriverReportLineItem) }
    expect(actual.length).to eq(2)
  end

  it 'should map each driver with matching trip' do
    actual = @line_item_generator.report_lines(drivers, trips)

    expect(actual[0].total_miles).to eq(17)
    expect(actual[1].total_miles).to eq(64)
  end

  it 'should filter out trips with an average speed less than 5' do
    trips = [
        Trip.from_file('Mark','07:15', '07:45', '17.3'),
        Trip.from_file('Dan', '01:30', '10:30', '38.8'),
        Trip.from_file('Dan', '12:01', '13:16', '42')
    ]

    actual = @line_item_generator.report_lines(drivers,trips)

    expect(actual.last.total_miles).to eq(42)
  end

  it 'should filter out trips with an average speed greater than 100' do
    trips = [
        Trip.from_file('Mark','07:15', '07:45', '17.3'),
        Trip.from_file('Dan', '06:30', '10:30', '86.8'),
        Trip.from_file('Dan', '12:01', '12:10', '42')
    ]

    actual = @line_item_generator.report_lines(drivers,trips)

    expect(actual.last.total_miles).to eq(87)
  end
end