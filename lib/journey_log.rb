require_relative 'journey'

class JourneyLog
  attr_reader :journeys, :entry_station, :exit_station
  def initialize
    @entry_station = nil
    @exit_station = nil
    @journeys = []
  end

  def touch_in(station)
    @entry_station = @ent_journey
  end

  def touch_out(station)
    @exit_station = @ex_journey
    @journeys = {entry_station: entry_station, exit_station: exit_station}
  end

  def complete_journey
    @entry_station = @exit_station = nil
  end

  def in_journey?
    !!entry_station
  end

  def create_entry_station(ent_journey = Journey.new)
    @ent_journey = ent_journey
  end

  def create_exit_station(ex_journey = Journey.new)
    @ex_journey = ex_journey
  end

  # def check_incomplete_journey(station, journey_log)
  #   if journey_log != nil
  #     if journey_log.in_journey?
  #       deduct(journey_class.fare)
  #      @journeys << {entry_station: journey_log.entry_station, exit_station: :incomplete}
  #     end
  #   end
  # end
  def complete?
    @entry_station != nil && @exit_station != nil
  end
end
