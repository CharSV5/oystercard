require 'oystercard'

describe Oystercard do
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
    it 'raises an error if touching in with less than the minimum balance' do
      expect { subject.touch_in }.to raise_error "Insufficient funds"
    end
  end
    it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end
  describe '#touch_in' do
    it 'can touch in' do
      subject.top_up(10)
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end
  describe '#touch_out' do
    it 'can touch out' do
      subject.top_up(10)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
    it 'deducts minimum fare' do
      subject.top_up(10)
      expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MINIMUM_FARE)
    end
  end
end
