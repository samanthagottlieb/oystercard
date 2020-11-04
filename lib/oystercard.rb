class Oystercard
  attr_reader :balance, :in_journey, :entry_station

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1.50

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    raise "Maximum balance of #{MAX_BALANCE} reached" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(entry_station)
    raise "Balance insufficient please top up" if @balance < 1
    @entry_station = entry_station
  end

  def touch_out
    deduct(MIN_FARE)
    @entry_station = nil
  end

private

  def deduct(fare)
    @balance -= fare
  end
end
