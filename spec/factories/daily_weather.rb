FactoryBot.define do
  factory :daily_weather do
    date { Faker::Date.between(from: '2022-09-23', to: '2022-09-25') }
    sunrise { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    sunset { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    temperature { Faker::Number.decimal(l_digits: 3, r_digits: 1) }
    max_temp { Faker::Number.decimal(l_digits: 3, r_digits: 1) }
    min_temp { Faker::Number.decimal(l_digits: 3, r_digits: 1) }
    conditions { Faker::Color.color_name }
    icon { Faker::Emotion.adjective }
  end
end
