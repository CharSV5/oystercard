class Oystercard
  attr_reader :balance, :maximum_balance, :journey_status, :journeys
  MAXIMUM_BALANCE = 90

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

  private
    def deduct(amount)
    @balance -= amount
  end
end
