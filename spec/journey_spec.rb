require 'journey'

describe Journey do
  let(:e_station) { double :en_station }
  let(:x_station) { double :ex_station }

  context 'after initialized with entry_station and exit_station' do
    subject{ Journey.new(e_station, x_station) }

    it 'stores an entry_station' do
      expect(subject.entry_station).to eq(e_station)
    end

    it 'stores an exit_station' do
      expect(subject.exit_station).to eq(x_station)
    end

    it 'returns minimum fare' do
      expect(subject.fare).to eq(Journey::MIN_FARE)
    end
  end

  context 'no exit station' do
    subject{ Journey.new(e_station) }

    it 'returns penalty fare' do
      expect(subject.fare).to eq(Journey::PENALTY_FARE)
    end
  end

  context 'no entry station' do
    subject{ Journey.new(nil, x_station) }

    it 'returns penalty fare' do
      expect(subject.fare).to eq(Journey::PENALTY_FARE)
    end
  end
end
