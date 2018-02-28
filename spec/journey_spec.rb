describe Journey do
describe '#touch_in' do
context 'in journey' do
  before(:each) do
    subject.top_up(10)
    subject.touch_in(entry_station)
  end
  it 'can touch in' do
    expect(subject).to be_in_journey
  end
  it 'stores the entry station' do
    expect(subject.entry_station).to eq entry_station
  end
end
it 'raises an error if touching in with less than the minimum balance' do
  expect { subject.touch_in(entry_station) }.to raise_error 'Insufficient funds'
end
end
describe '#touch_out' do
it 'can touch out' do
  subject.top_up(10)
  subject.touch_in(entry_station)
  subject.touch_out(exit_station)
  expect(subject).not_to be_in_journey
end
it 'deducts minimum fare' do
  subject.top_up(10)
  expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-Oystercard::MINIMUM_FARE)
end
end
end
