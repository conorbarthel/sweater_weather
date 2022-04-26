class RoadTrip
  include Convertable
  attr_reader :id, :type, :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(destination_data, forecast_data)
    @id = nil
    @type = 'roadtrip'
    @start_city = "#{destination_data[:route][:locations].first[:adminArea5]}, #{destination_data[:route][:locations].first[:adminArea3]}"
    @end_city = "#{destination_data[:route][:locations].last[:adminArea5]}, #{destination_data[:route][:locations].last[:adminArea3]}"
    @travel_time = convert_time(destination_data[:route][:formattedTime])
    @weather_at_eta = {
      temperature: convert_temp(forecast_data[:hourly][hour_to_dest(@travel_time)][:temp]),
      conditions: forecast_data[:hourly][hour_to_dest(@travel_time)][:weather].first[:description]
      }
  end

  def hour_to_dest(time)
    split_time = time.split(' ')
    if split_time[2].to_i >= 30
      return split_time[0].to_i + 1
    else
      return split_time[0].to_i
    end
  end

end
