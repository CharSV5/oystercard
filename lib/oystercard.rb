class Oystercard
  attr_reader :balance, :maximum_balance, :journey_status
  MINIMUM_BALANCE = 1
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @maximum_balance =  MAXIMUM_BALANCE
    @journey_status = false
  end

  def top_up(amount)
    raise "Maximum balance of #{maximum_balance} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "Insufficient funds" if balance < MINIMUM_BALANCE
    @journey_status = true
  end

  def touch_out
    @journey_status = false
  end

  def in_journey?
    journey_status
  end
end
