require_relative 'oystercard'

class Journey
    attr_reader :exit_station, :entry_station
  MINIMUM_FARE = 1
  def touch_in(station)
    raise "Insufficient funds" if balance < MINIMUM_FARE
    @exit_station = nil
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @journeys << {entry_station: @entry_station, exit_station: @exit_station}
    @entry_station = nil
    @exit_station = station

  end

  def in_journey?
    #!!entry_station
    
  end
end
