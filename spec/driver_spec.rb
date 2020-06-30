require 'spec_helper'

describe Driver do
  context 'on initialization' do
    before do
      @name = "Dan"
      @driver = Driver.new(@name)
    end

    it 'should create driver object with name set' do
      expect(@driver.name).to eq(@name)
    end
  end
end