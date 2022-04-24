module Convertable
  def convert_temp(temp)
    ((temp - 273.15) * 9/5 + 32).round(1)
  end
end
