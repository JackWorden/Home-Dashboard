class ForecastParser
  def initialize(response)
    @response = response
  end

  def parse
    [
      generate_day(day_one_segments),
      generate_day(day_two_segments)
    ]
  end

  private

  attr_reader :response

  def day_one_segments
    response['list'][0...7]
  end

  def day_two_segments
    response['list'][8...15]
  end

  def generate_day(segments)
    temps = aggregate_temperatures(segments)
    weather = get_weather_frequency(segments).max_by { |_, v| v }
    ForecastDay.new(
      temps[:max_temps].max,
      temps[:min_temps].min,
      weather,
      day_of_week(segments[0]['dt'])
    )
  end

  def aggregate_temperatures(segments)
    temp_hash = Hash.new { |h, k| h[k] = [] }
    segments.each_with_object(temp_hash) do |segment, temp_hash|
      temp_hash[:min_temps] << segment['main']['temp_min']
      temp_hash[:max_temps] << segment['main']['temp_max']
    end
  end

  def get_weather_frequency(segments)
    freq_hash = Hash.new { |h, k| h[k] = 0 }
    segments.each_with_object(freq_hash) do |segment, freq_hash|
      freq_hash[segment['weather'][0]['main']] += 1
    end
  end

  def day_of_week(epoch_time)
    Date.strptime(epoch_time.to_s, '%s').strftime('%a')
  end
end