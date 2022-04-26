class Munchie
  include Convertable
  attr_reader :id, :type, :destination_city, :travel_time, :forecast, :restaurant

  def initialize(destination, restaurant_data, destination_data, forecast_data)
    @id = nil
    @type = 'munchie'
    @destination_city = destination
    @travel_time = convert_time(destination_data[:route][:formattedTime])
    @forecast = {
      summary: forecast_data[:weather].first[:description],
      temperature: convert_temp(forecast_data[:temp])
    }
    @restaurant = {
      name: restaurant_data[:businesses].first[:name],
      address: address_convert(restaurant_data[:businesses].first[:location][:display_address])
    }
  end

  def address_convert(address)
    formatted = "#{address[0]}, #{address[1]}#{address[2]}"
  end
end
