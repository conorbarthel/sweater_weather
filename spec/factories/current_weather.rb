FactoryBot.define do
  factory :daily_weather do
    datetime { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    sunrise { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    sunset { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    temperature { Faker::Number.decimal(l_digits: 3, r_digits: 1) }
    feels_like { Faker::Number.decimal(l_digits: 3, r_digits: 1) }
    humidity { Faker::Number.number(digits: 2) }
    uvi { Faker::Number.decimal(l_digits: 2) }
    visibility { Faker::Number.number(digits: 2) }
    conditions { Faker::Color.color_name }
    icon { Faker::Emotion.adjective }
  end
end
