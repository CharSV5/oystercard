require_relative 'journey'

class Oystercard
  attr_reader :balance, :maximum_balance, :journey_status, :journeys, :journey_class
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @maximum_balance = MAXIMUM_BALANCE
    @journeys = []
  end

  def top_up(amount)
    raise "Maximum balance of #{maximum_balance} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def create_journey(journey_class = Journey.new)
    @journey_class = journey_class
  end

  def start_journey(station)
    raise "Insufficient funds" if balance < Journey::MINIMUM_FARE
      # if journey_class != nil
      #   if journey_class.in_journey?
      #     deduct(journey_class.fare)
      #    @journeys << {entry_station: journey_class.entry_station, exit_station: :incomplete}
      #   end
      # end
      check_incomplete_journey
    create_journey
    journey_class.touch_in(station)
  end

  def end_journey(station)
    @journey_class.touch_out(station)
    @journeys.push(journey_class.journey_entry)
    deduct(journey_class.fare)
    @journey_class.complete_journey
  end

  def check_incomplete_journey
    if journey_class != nil
      if journey_class.in_journey?
        deduct(journey_class.fare)
       @journeys << {entry_station: journey_class.entry_station, exit_station: :incomplete}
      end
    end
  end

  private
    def deduct(amount)
    @balance -= amount
  end
end
