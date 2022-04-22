FactoryBot.define do
  factory :weather do
    sunrise { "2022-04-22 16:36:28" }
    sunset { "2022-04-22 16:36:28" }
    temperature { 1.5 }
    feelsLike { 1.5 }
    humidity { 1 }
    uvi { 1 }
    visability { 1 }
    conditions { "MyString" }
    icon { "MyString" }
    maxTemp { 1.5 }
    minTemp { 1.5 }
    time { "2022-04-22 16:36:28" }
  end
end
