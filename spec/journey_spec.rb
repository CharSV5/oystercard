require 'journey'

describe Journey do
  describe '#touch_in' do
    it 'records an entry_station' do
      expect(subject.touch_in('Kilburn')).to eq 'Kilburn'
    end
  end
  describe '#touch_out' do
    it 'creates a journey entry' do
      subject.touch_in('Kilburn')
      subject.touch_out('Hampstead')
      expect(subject.journey_entry).to eq({:entry_station => 'Kilburn', :exit_station => 'Hampstead'})
    end
    it 'ends the journey' do
      subject.touch_in('Kilburn')
      subject.touch_out('Hampstead')
      subject.complete_journey
      expect(subject).not_to be_in_journey
    end
  end
end
