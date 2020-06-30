require 'spec_helper'

describe DrivingHistoryReport do
  describe 'generate' do
    let(:source) { 'test.txt' }
    let(:destination) { 'history_report.txt' }
    let(:parser) { double('parser', :parse => [[double('driver')], [double('trips')]]) }
    let(:line_items) { double('line_items') }
    let(:line_item_generator) { double('line_item_generator', :report_lines => line_items) }
    let(:file_content) { "Mark: 42 miles @ 34mph\nDan: 17 miles @ 34mph" }
    let(:formatter) { double('formatter', :format => file_content) }

    before do
      allow(LineItemGenerator).to receive(:new).and_return(line_item_generator)
      allow(File).to receive(:write).with(destination, file_content)
      @report = DrivingHistoryReport.new(parser, formatter)
    end

    it 'should write report contents to file' do
      @report.generate(source, destination)

      expect(File).to have_received(:write).with(destination, file_content)
    end

    it 'should puts message when file contains only trip commands ' do
      allow(parser).to receive(:parse).and_return([[], [double('trip')]])

      expect(STDOUT).to receive(:puts).with('Report not generated. There was not enough information found in file to generate the report.')

      @report.generate(source, destination)
    end

    it 'should puts message when file contains no contents' do
      allow(parser).to receive(:parse).and_return([[], []])

      expect(STDOUT).to receive(:puts).with('Report not generated. There was not enough information found in file to generate the report.')

      @report.generate(source, destination)
    end
  end
end