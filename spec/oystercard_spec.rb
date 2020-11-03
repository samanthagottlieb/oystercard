require 'oystercard'

describe Oystercard do
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
      max_balance = Oystercard::LIMIT
      subject.top_up(max_balance)
      expect { subject.top_up(1) }.to raise_error("Maximum balance of #{max_balance} reached")
    end
  end

  describe '#deduct' do
    it 'responds to the method' do
      expect(subject).to respond_to(:deduct).with(1).argument
    end

    it 'deducts fare from balance' do
      subject.top_up(10)
      expect { subject.deduct(10) }.to change { subject.balance }.by(-10)
    end
  end
end
