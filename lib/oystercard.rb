require './lib/journey'

class Oystercard
  attr_reader :balance, :journeys, :current_journey

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @journeys = []
    @current_journey = nil
  end

  def top_up(amount)
    raise "Maximum balance of #{MAX_BALANCE} reached" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    !!@current_journey
  end

  def touch_in(entry_station)
    raise "Balance insufficient please top up" if @balance < 1
    @current_journey = Journey.new(entry_station)
  end

  def touch_out(exit_station)
    @current_journey.exit_station = exit_station
    deduct(@current_journey.fare)
    store_journey
    @current_journey = nil
  end

private

  def deduct(fare)
    @balance -= fare
  end

  def store_journey
    @journeys << @current_journey
  end
end
