class ForecastDay
  attr_reader :high, :low, :weather, :day

  def initialize(high, low, weather, day = 'Today')
    @high = high.round(0)
    @low = low.round(0)
    @weather = weather
    @day = day
  end
end