require_relative 'journey'

class Oystercard
  attr_reader :balance, :maximum_balance, :journey_status, :journeys, :journey_class
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @maximum_balance =  MAXIMUM_BALANCE
    @entry_station = nil
    @journeys = []
  end

  def top_up(amount)
    raise "Maximum balance of #{maximum_balance} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def start_journey(station, journey_class = Journey.new)
    raise "Insufficient funds" if balance < MINIMUM_FARE
    @journey_class = journey_class
    journey_class.touch_in(station)
  end

  def end_journey(station)
    @journey_class.touch_out(station)
    @journeys.push(journey_class.journey_entry)
    deduct(fare)
    @journey_class.complete_journey
  end

  def fare
    @journey_class.exit_station.nil? || @journey_class.entry_station.nil? ? 6 : 1
  end

  private
    def deduct(amount)
    @balance -= amount
  end
end
