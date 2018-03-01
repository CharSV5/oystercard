class JourneyLog
  attr_reader :journeys, :entry_station, :exit_station
  def initialize
    @entry_station = nil
    @exit_station = nil
    @journeys = []
  end

  def touch_in(station)
    @entry_station = station
  end

  def touch_out(station)
    @exit_station = station
    @journeys = {entry_station: entry_station, exit_station: exit_station}
  end

  def complete_journey
    @entry_station = @exit_station = nil
  end

  def in_journey?
    !!entry_station
  end

end
