class Journey
    attr_reader :exit_station, :entry_station, :journey_entry

  def touch_in(station)

    @entry_station = station
  end

  def touch_out(station)
    @exit_station = station
    @journey_entry = {entry_station: entry_station, exit_station: exit_station}
    @entry_station = @exit_station = nil

  end
  def in_journey?
    !!entry_station
  end
end
