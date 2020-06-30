require_relative 'lib/driving_history_report'

source = ARGV[0]
destination = "driving_history_report.txt"
report = DrivingHistoryReport.new
report.generate(source, destination)