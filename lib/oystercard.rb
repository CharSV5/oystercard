require_relative 'journey_log'


class Oystercard
  attr_reader :balance, :maximum_balance, :journey_status, :journeys, :journey_log
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @maximum_balance = MAXIMUM_BALANCE

  end

  def top_up(amount)
    raise "Maximum balance of #{maximum_balance} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def create_journey(journey_log = JourneyLog.new)
    @journey_log = journey_log
  end

  def start_journey(station)
    raise "Insufficient funds" if balance < Journey::MINIMUM_FARE
    journey_log.check_incomplete_journey(station, journey_log) unless journey_log.nil?
    create_journey
    journey_log.touch_in(station)
  end

  def end_journey(station)
    @journey_log.touch_out(station)
    @journeys.push(journey_log.journeys)
    deduct(journey_class.fare)
    @journey_log.complete_journey
  end



  private
    def deduct(amount)
    @balance -= amount
  end
end
