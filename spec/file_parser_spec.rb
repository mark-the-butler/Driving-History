require 'spec_helper'

describe FileParser do
  describe 'parse' do
    let(:file) { double('file') }
    let(:trip) { double('Trip', :class => Trip) }

    before do
      @file_name = 'file.txt'
      allow(File).to receive(:open).with(@file_name).and_yield(file)
      allow(file).to receive(:each).and_yield('Driver Dan').and_yield('Driver Lauren').and_yield('Trip Dan 07:15 07:45 17.3').and_yield('Trip Lauren 12:01 13:16 42.0')
      allow(Trip).to receive(:from_file) { trip }
      @actual_drivers, @actual_trips = FileParser.new.parse(@file_name)
    end

    it 'should call File.open with file name' do
      allow(File).to receive(:open).with(@file_name)

      expect(File).to have_received(:open).with(@file_name)
    end

    it 'should return a driver for each driver command' do
      expect(@actual_drivers.length).to eq(2)
    end

    it 'should return drivers with name set' do
      expect(@actual_drivers.first).to be_an_instance_of(Driver)
      expect(@actual_drivers.first.name).to eq('Dan')
    end

    it 'should return a trip for each trip command' do
      expect(@actual_trips.length).to eq(2)
    end

    it 'should return trips with trip attributes set' do
      expect(@actual_trips.first).to eq(trip)
    end
  end
end