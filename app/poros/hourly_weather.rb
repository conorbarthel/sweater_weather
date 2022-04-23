class HourlyWeather
  attr_reader :datetime,
              :temperature,
              :conditions,
              :icon

  def initialize(data)
     @datetime = Time.at(data[:dt]).to_s.split(' ').pop
     @temperature = data[:temp]
     @conditions = data[:weather].first[:description]
     @icon = data[:weather].first[:icon]
  end
end
