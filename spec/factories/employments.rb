FactoryBot.define do
  factory :employment do
    employer { Faker::Company.name }
    date_started { Faker::Date.backward(days: 365) }
    date_ended { Faker::Date.backward(days: 30) }
    personal_data
  end
end
