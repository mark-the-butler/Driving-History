class FileParser

  def parse(file_name)
    report_data = [] 

    File.open(file_name) do |file|
      file.each do |line|
        line_as_array = line.split(' ')
        command, *args = line_as_array

        report_data << add_data(command, args)
      end
    end
    [report_data.select { |data| data.class == Driver }, report_data.select { |data| data.class == Trip }]
  end

  private

  def add_data(command, args)
    if command.upcase == 'DRIVER'
      Driver.new(args[0])
    elsif command.upcase == 'TRIP'
      Trip.from_file(*args)
    end
  end
end