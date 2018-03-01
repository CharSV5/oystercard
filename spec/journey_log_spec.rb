require 'journey_log'

describe JourneyLog do
  describe '#touch_in' do
    it 'records an entry_station' do
      expect(subject.touch_in('Kilburn')).to eq 'Kilburn'
    end
  end
  describe '#touch_out' do
    it 'creates an entry in journeys' do
      subject.touch_in('Kilburn')
      subject.touch_out('Hampstead')
      expect(subject.journeys).to eq({:entry_station => 'Kilburn', :exit_station => 'Hampstead'})
    end
    it 'ends the journey' do
      subject.touch_in('Kilburn')
      subject.touch_out('Hampstead')
      subject.complete_journey
      expect(subject).not_to be_in_journey
    end
  end
  # describe '#check_incomplete_journey' do
  #
  #   let(:journey) { { entry_station: 'entry_station', exit_station: 'incomplete' } }
  #   it 'stores an incomplete journey' do
  #     journey_class = double('journey_class', in_journey?: true, fare: Journey::PENALTY_FARE, entry_station: 'entry_station')
  #     subject.check_incomplete_journey('entry_station', journey_class)
  #     expect(subject.journeys).to include journey
  #   end
  # end
end
