$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib/models'))
require 'rspec'
require 'driving_history_report'
require 'driver'
require 'trip'
require 'file_parser'
require 'line_item_generator'
require 'file_report_formatter'
require 'driver_report_line_item'
require 'speed_calculator'
