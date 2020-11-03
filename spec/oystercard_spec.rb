require 'oystercard'

describe Oystercard do
  it 'creates an Oystercard instance' do
    expect(subject).to be_instance_of(Oystercard)
  end

  context '#balance' do
    it 'responds to the method' do
      expect(subject).to respond_to(:balance)
    end

    it 'sets a default balance of 0' do
      expect(subject.balance).to eq(0)
    end
  end
end
