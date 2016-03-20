class WeatherFetcher
  require 'open_weather'

  class << self
    OVIEDO_ID = '4167348'

    def fetch_current_weather
      response = OpenWeather::Current.city_id(OVIEDO_ID, request_params)
      ForecastDay.new(
        response['main']['temp_max'],
        response['main']['temp_min'],
        response['weather'][0]['main']
      )
    end

    def fetch_forecast
      response = OpenWeather::Forecast.city_id(OVIEDO_ID, request_params)
      ForecastParser.new(response).parse
    end

    private

    def request_params
      { units: 'Imperial', APPID: Dashboard.CONFIG[:openweather_app_id] }
    end
  end
end
