class CurrentWeather
  include Convertable
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(data)
     @datetime = Time.at(data[:dt]).to_s
     @sunrise = Time.at(data[:sunrise]).to_s
     @sunset = Time.at(data[:sunset]).to_s
     @temperature = convert_temp(data[:temp])
     @feels_like = convert_temp(data[:feels_like])
     @humidity = data[:humidity]
     @uvi = data[:uvi]
     @visibility = data[:visibility]
     @conditions = data[:weather].first[:description]
     @icon = data[:weather].first[:icon]
  end

  # def convert_temp(temp)
  #   ((temp - 273.15) * 9/5 + 32).round(1)
  # end

end
