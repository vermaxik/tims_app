FactoryGirl.define do
  factory :traffic_disruption do
    disruption_id { Faker::Number.number(4) }
    status { 'Active' }
    severity { 'Moderate' }
    level_of_interest { 'High' }
    category { Faker::Name.name }
    subcategory { Faker::Name.name }
    event_start_at { DateTime.now }
    location { Faker::Name.name }
    longitude { Faker::Name.name }
    latitude { Faker::Name.name }
  end
end
