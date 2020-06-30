require_relative 'line_item_generator'
require_relative 'file_report_formatter'
require_relative 'file_parser'
require_relative 'speed_calculator'
require_relative 'models/driver'
require_relative 'models/trip'
require_relative 'models/driver_report_line_item'

class DrivingHistoryReport

  def initialize(parser = FileParser.new, formatter = FileReportFormatter.new)
    @parser = parser
    @formatter = formatter
    @line_item_generator = LineItemGenerator.new
  end

  def generate(filename, dest_filename)
    drivers, trips = @parser.parse(filename)

    if drivers.empty? && trips.empty? || drivers.empty? && trips.length >= 1
      puts 'Report not generated. There was not enough information found in file to generate the report.'
      return
    end

    report_data = @line_item_generator.report_lines(drivers, trips)
    File.write(dest_filename, @formatter.format(report_data))
  end
end