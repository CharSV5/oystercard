class Journey
    attr_reader :exit_station, :entry_station, :journey_entry
    MINIMUM_FARE = 1
    PENALTY_FARE = 6
  def initialize(station = Station.new)
    @station = station 
    @entry_station = entry_station
    @exit_station = exit_station
  end



  def fare
    if exit_station.nil? || entry_station.nil?
      PENALTY_FARE
    else
      MINIMUM_FARE
    end
  end
end
