class Oystercard
  attr_reader :balance, :maximum_balance, :state_of_journey
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @maximum_balance =  MAXIMUM_BALANCE
    @state_of_journey = :out
  end

  def top_up(amount)
    raise "Maximum balance of #{maximum_balance} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @state_of_journey = :in
  end

  def touch_out
    @state_of_journey = :out
  end

  def in_journey?
    state_of_journey == :in
  end
end
