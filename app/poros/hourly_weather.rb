class HourlyWeather
  include Convertable
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(data)
     @time = Time.at(data[:dt]).to_s.split(' ')[1]
     @temperature = convert_temp(data[:temp])
     @conditions = data[:weather].first[:description]
     @icon = data[:weather].first[:icon]
  end
end
