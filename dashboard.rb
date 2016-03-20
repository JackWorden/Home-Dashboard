class Dashboard < Sinatra::Base
  Tilt.register Tilt::ERBTemplate, 'html.erb'

  set :CONFIG, YAML.load(File.read(File.expand_path('../application.yml', __FILE__)))

  get '/' do
    @todo_list = TodoFetcher.fetch_list
    @grade_list = GradeFetcher.fetch_list
    @current_weather = WeatherFetcher.fetch_current_weather
    @weather_forecast = WeatherFetcher.fetch_forecast
    binding.pry
    erb :dashboard, layout: :layout
  end


  helpers do
    # Helper for rending partials. Usage:
    # partial(:template, locals: { foo: 'bar' }
    # Also capable of looping over collections with collection
    # Shout out to Sinatra

    def partial(template, *args)
      options = (args.last.is_a?(::Hash) ? args.pop : {})
      options.merge!(:layout => false)
      if collection = options.delete(:collection) then
        collection.inject([]) do |buffer, member|
          buffer << erb(template, options.merge(
              :layout => false,
              :locals => {template.to_sym => member}
          )
          )
        end.join("\n")
      else
        erb(template, options)
      end
    end

    # Determines color of assignment icon in Todo list depending on
    # how close it is to being due
    def urgency_color(date)
      return nil unless date.to_time.localtime.to_date == Date.today
      if date.hour - DateTime.now.hour < 6
        'red'
      else
        'yellow'
      end
    end


    # Determines color of grade icon in Grade list depending on
    # What the grade is

    def grade_color(grade)
      if grade < 70
        'red'
      elsif grade < 80
        'yellow'
      elsif grade < 90
        'blue'
      else
        'green'
      end
    end
  end
end