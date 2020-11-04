require 'oystercard'

describe Oystercard do
  let(:station) { double :bank }

  it 'creates an Oystercard instance' do
    expect(subject).to be_instance_of(Oystercard)
  end

  describe '#balance' do
    it 'responds to the method' do
      expect(subject).to respond_to(:balance)
    end

    it 'sets a default balance of 0' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it 'responds to the method' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it 'adds amount to balance' do
      expect { subject.top_up(10) }.to change { subject.balance }.from(0).to(10)
    end

    it 'enforces a maximum balance' do
      max = Oystercard::MAX_BALANCE
      subject.top_up(max)
      expect { subject.top_up(1) }.to raise_error("Maximum balance of #{max} reached")
    end
  end

  describe '#in_journey?' do
    it 'responds to the method' do
      expect(subject).to respond_to(:in_journey?)
    end
  end

  describe '#touch_in' do

    it 'responds to the method' do
      expect(subject).to respond_to(:touch_in)
    end

    it 'raises an error if balance is insufficient' do
      expect { subject.touch_in(station) }.to raise_error("Balance insufficient please top up")
    end

    it 'assigns a station at touch in' do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject.entry_station).to eq(station)
    end
  end

  describe '#touch_out' do
    it 'responds to the method' do
      expect(subject).to respond_to(:touch_out)
    end

    it 'deducts minimum fare from balance' do
      expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MIN_FARE)
    end
  end
end
