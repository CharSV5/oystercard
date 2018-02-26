class Oystercard
  attr_reader :balance, :maximum_balance
  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @maximum_balance =  MAXIMUM_BALANCE
  end

  def top_up(amount)
    raise "Maximum balance of #{maximum_balance} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end
