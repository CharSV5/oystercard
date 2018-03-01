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

  describe '#check_incomplete_journey' do

    let(:journey) { { entry_station: entry_station, exit_station: :incomplete } }
    it 'stores an incomplete journey' do
      journey_class = double('journey_class', in_journey?: true, fare: Journey::PENALTY_FARE, entry_station: entry_station)
      subject.check_incomplete_journey(entry_station, journey_class)
      expect(subject.journeys).to include journey
    end
  end

  it 'is initially not in a journey' do
    expect(subject.journey_class).to eq nil
  end

  it 'has an empty list of journeys by default' do
    expect(subject.journeys).to be_empty
  end

  let(:journey) { { entry_station: entry_station, exit_station: exit_station } }

  it 'stores a journey' do
    subject.top_up(10)
    subject.start_journey(entry_station)
    subject.end_journey(exit_station)
    subject.journeys.push(journey)
    expect(subject.journeys).to include journey
  end

  it 'raises an error if starting journey with less than the minimum balance' do
    expect { subject.start_journey(entry_station) }.to raise_error 'Insufficient funds'
  end
  describe '#end_journey' do
  it 'deducts minimum fare' do
    subject.top_up(10)
    subject.start_journey(entry_station)
    expect { subject.end_journey(exit_station) }.to change { subject.balance }.by(-Journey::MINIMUM_FARE)
  end
  end
  it 'deducts a penalty fare if not touched out' do
    subject.top_up(10)
    subject.start_journey(entry_station)
    expect{ subject.start_journey(entry_station) }.to change { subject.balance }.by (-Journey::PENALTY_FARE)
  end
end
