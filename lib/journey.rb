class Journey
attr_reader :entry_station
attr_accessor :exit_station

MIN_FARE = 1.50
PENALTY_FARE = 6

  def initialize(entry_station, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def fare
    return PENALTY_FARE if !@entry_station || !@exit_station
    return MIN_FARE
  end
end
