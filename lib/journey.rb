class Journey
    attr_reader :exit_station, :entry_station, :journey_entry
    MINIMUM_FARE = 1
    PENALTY_FARE = 6

  def touch_in(station)
    @entry_station = station
  end

  def touch_out(station)
    @exit_station = station
    @journey_entry = {entry_station: entry_station, exit_station: exit_station}
  end

  def complete_journey
    @entry_station = @exit_station = nil
  end

  def in_journey?
    !!entry_station
  end

  def fare
    if exit_station.nil? || entry_station.nil?
      PENALTY_FARE
    else
      MINIMUM_FARE
    end
  end
end
