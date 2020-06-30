require 'spec_helper'

describe FileReportFormatter do
  let(:line_item_1) { double('line_item_1', :name => 'Mark', :total_miles => 35, :average_speed => 25) }
  let(:line_item_2) { double('line_item_2', :name => 'Bob', :total_miles => 68, :average_speed => 42) }
  let(:line_items) { [line_item_1, line_item_2] }

  before do
    @formatter = FileReportFormatter.new
  end

  it 'should return a string containing line_item total miles greatest to least' do
    actual = @formatter.format(line_items)

    expect(actual).to eq("Bob: 68 miles @ 42 mph\nMark: 35 miles @ 25 mph")
  end

  it 'should return a different string format for line_items with 0 miles' do
    line_item_3 = double('line_item_3', :name => 'Gary', :total_miles => 0, :average_speed => 0)
    line_items << line_item_3

    actual = @formatter.format(line_items)

    expect(actual).to eq("Bob: 68 miles @ 42 mph\nMark: 35 miles @ 25 mph\nGary: 0 miles")
  end
end