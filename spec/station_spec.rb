require 'station'

describe Station do
  context 'after initialized with name and zone' do
    let(:name) { double :name }
    let(:zone) { double :zone }
    subject { Station.new(name, zone) }

    it 'stores name' do
      expect(subject.name).to eq(name)
    end

    it 'stores zone' do
      expect(subject.zone).to eq(zone)
    end
  end
end
