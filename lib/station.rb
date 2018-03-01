class Station
  attr_reader :name, :zone
  def initialize(name, zone)
    @name = name
    @zone = zone
  end
end
# As of now, station is just a variable in oystercard, no zone included, how to fix that and test with doubles?
