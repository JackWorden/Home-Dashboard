class ForecastDay
  attr_reader :high, :low, :weather, :day

  def initialize(high, low, weather, day = 'Today')
    @high = high.round(0)
    @low = low.round(0)
    @weather = weather
    @day = day
  end

  def average_temp
    ((high + low)/2).round(0)
  end
end