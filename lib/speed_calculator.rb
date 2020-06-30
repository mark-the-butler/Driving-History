class SpeedCalculator
  def self.calculate_average(distance, time)
    ((distance / time) * 3600).round
  end
end