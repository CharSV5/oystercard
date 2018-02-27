class Oystercard
  attr_reader :balance, :maximum_balance, :journey_status, :entry_station
  MINIMUM_FARE = 1
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @maximum_balance =  MAXIMUM_BALANCE
    @entry_station = nil
  end

  def top_up(amount)
    raise "Maximum balance of #{maximum_balance} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient funds" if balance < MINIMUM_FARE
    @entry_station = station

  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil

  end

  def in_journey?
    !!entry_station
  end
end

private
def deduct(amount)
  @balance -= amount
end
