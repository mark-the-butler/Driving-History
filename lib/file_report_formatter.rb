class FileReportFormatter
  def format(line_items)
     line_items
         .sort_by(&:total_miles)
         .reverse
         .map { |line_item| line_item.total_miles > 0 ? line_with_miles(line_item) : line_without_miles(line_item) }
         .join("\n")
  end

  private

  def line_without_miles(line_item)
    "#{line_item.name}: #{line_item.total_miles} miles"
  end

  def line_with_miles(line_item)
    "#{line_item.name}: #{line_item.total_miles} miles @ #{line_item.average_speed} mph"
  end
end