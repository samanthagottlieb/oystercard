class Oystercard
  attr_reader :balance, :in_journey, :entry_station, :exit_station, :journeys

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1.50

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journeys = []
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

  def touch_out(exit_station)
    deduct(MIN_FARE)
    @exit_station = exit_station
    @journeys << { entry_station: @entry_station, exit_station: @exit_station }
    @entry_station = nil
  end

private

  def deduct(fare)
    @balance -= fare
  end
end
