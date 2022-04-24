FactoryBot.define do
  factory :hourly_weather do
    datetime { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    temperature { Faker::Number.decimal(l_digits: 3, r_digits: 1) }
    conditions { Faker::Color.color_name }
    icon { Faker::Emotion.adjective }
  end
end
