require 'oystercard'

describe Oystercard do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end
  describe '#top_up' do
    it 'can top up balance' do
      expect { subject.top_up 1 }.to change { subject.balance }.by 1
    end
    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end
  end

    it 'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end

  

  it 'has an empty list of journeys by default' do
    expect(subject.journeys).to be_empty
  end

  let(:journey) { { entry_station: entry_station, exit_station: exit_station } }

  it 'stores a journey' do
    subject.top_up(10)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    subject.journeys.push(journey)
    expect(subject.journeys).to include journey
  end
end
