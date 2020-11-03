class Oystercard
  attr_reader :balance, :in_journey
  
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Maximum balance of #{MAX_BALANCE} reached" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @in_journey = !@in_journey
  end

  def touch_in
    raise "Balance insufficient please top up" if @balance < 1
    in_journey?
  end

  def touch_out
    in_journey?
  end

end
