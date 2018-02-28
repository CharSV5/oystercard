require 'journey'

describe Journey do
  describe '#touch_in' do
    it 'records an entry_station' do
      expect(subject.touch_in('Kilburn')).to eq 'Kilburn'
    end
  end
  describe '#touch_out' do
    it 'records an exiit station' do
      subject.touch_out('Hampstead')
      expect(subject.exit_station).to eq 'Hampstead'
    end
    it 'creates a journey entry' do
      subject.touch_in('Kilburn')
      subject.touch_out('Hampstead')
      expect(subject.journey_entry).to eq({:entry_station => 'Kilburn', :exit_station => 'Hampstead'})
    end
  end
end
