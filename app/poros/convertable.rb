module Convertable
  def convert_temp(temp)
    ((temp - 273.15) * 9/5 + 32).round(1)
  end

  def convert_time(time)
    chunks = time.split(":")
    formatted = "#{chunks[0]} hours #{chunks[1]} min"
  end
end
